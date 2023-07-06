using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SQLite;
using System.Data.Entity.Core.Metadata.Edm;
using Microsoft.Ajax.Utilities;
using System.Runtime.Remoting.Messaging;
using System.EnterpriseServices.CompensatingResourceManager;

namespace Artisan_Alleyway.WebForm.database
{
    public class mydatabase
    {
        private static string connectionString = "Data Source=E:\\document\\Ong Cong Kin\\Degree\\2024 - 04\\Progamming Elective II (2)\\code\\Artisan_Alleyway\\Artisan_Alleyway\\WebForm\\database\\artisan.db;Version=3;";

        public static List<model_category> getCategory()
        {
            List<model_category> model_Categories = new List<model_category>();

            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM CATEGORIES";
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    using (SQLiteDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            model_category category = new model_category();  

                            int id = reader.GetInt32(0);
                            string name = reader.GetString(1);
                            string image = reader.GetString(2);

                            category.id = id;
                            category.name = name;
                            category.image = image;
                            
                            model_Categories.Add(category);
                        }
                    }
                }


                connection.Close();
            }
            return model_Categories;
        }

        public static List<model_item> getItemsByCategory(int id) 
        {
            List<model_item> model_Items = new List<model_item>();

            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM ITEM WHERE CATEGORY = " + id.ToString() + ";";
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    using (SQLiteDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            model_item item = new model_item();
                            item.id = reader.GetInt32(0);
                            item.name = reader.GetString(1);
                            item.image = reader.GetString(2);
                            item.price = reader.GetFloat(3);
                            item.sold = reader.GetInt32(4);
                            item.category = reader.GetInt32(5);

                            model_Items.Add(item);
                        }
                    }
                }

                connection.Close();
            }

            return model_Items;
        }

        public static model_item getItemById(int id)
        {
            model_item item = new model_item();

            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM ITEM WHERE ID = " + id.ToString() + ";";
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    using(SQLiteDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            item.id = reader.GetInt32(0);
                            item.name = reader.GetString(1);
                            item.image = reader.GetString (2);
                            item.price = reader.GetFloat(3);
                            item.sold = reader.GetInt32(4);
                            item.category = reader.GetInt32(5);
                        }
                    }
                }

                connection.Close();
            }

            return item;
        }

        public static List<model_cart> getCartByUserId(int userId)
        {
            List<model_cart> models = new List<model_cart>();

            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM CART WHERE USERID = " + userId.ToString() + ";";
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    using (SQLiteDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            model_cart model = new model_cart();
                            model.userId = reader.GetInt32(0);
                            model.item = getItemById(reader.GetInt32(1));
                            model.amount = reader.GetInt32(2);
                                
                            models.Add(model);
                        }
                    }
                }
            }

            return models;

        }

        public static void addItemToCart(int userId, int itemId, int amount)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();

                string checkRepeat = "SELECT * FROM CART WHERE USERID = " + userId + " AND ITEMID = " + itemId + ";";
                using (SQLiteCommand check = new SQLiteCommand(checkRepeat, connection))
                {
                    using (SQLiteDataReader reader = check.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int newAmount = reader.GetInt32(2) + amount;
                            string update = "UPDATE CART SET AMOUNT = " + newAmount + " WHERE USERID = " + userId + " AND ITEMID = " + itemId + ";";

                            using (SQLiteCommand updateCommand = new SQLiteCommand(update, connection))
                            {
                                updateCommand.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            string insert = "INSERT INTO CART (USERID, ITEMID, AMOUNT) VALUES(" + userId + "," + itemId + "," + amount + ");";
                            using (SQLiteCommand insertCommand = new SQLiteCommand(insert, connection))
                            {
                                insertCommand.ExecuteNonQuery();
                            }

                        }
                    }


                    connection.Close();
                }
            }
        }

        public static model_user getUserById(int userId)
        {
            model_user user = new model_user();

            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM USER WHERE ID = " + userId + ";";
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    using (SQLiteDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            user.id = reader.GetInt32(0);
                            user.name = reader.GetString(1);
                            user.phone = reader.GetString(2);
                            user.email = reader.GetString(3);
                            user.address = reader.GetString(4);
                            user.image = reader.GetString(5);
                        }
                    }
                }
            }

            return user;
        }

        public static void addTransaction(model_transaction transaction)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO TRANSACTION_HISTORY (USERID, NAME, PHONE, EMAIL, ADDRESS) VALUES (" + transaction.userId + ",'" + transaction.name +"','"+transaction.phone + "','"+ transaction.email+"','"+transaction.address+"');";
                using (SQLiteCommand insertCommand = new SQLiteCommand(query, connection))
                {
                    insertCommand.ExecuteNonQuery();
                }

                string query1 = "SELECT * FROM TRANSACTION_HISTORY WHERE USERID = " + transaction.userId + ";";
                using (SQLiteCommand command = new SQLiteCommand(query1, connection))
                {
                    using (SQLiteDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // read until latest
                            transaction.id = reader.GetInt32(0);
                        }
                    }
                }


                foreach (model_transaction.transaction_item item in transaction.Items)
                {
                    string query2 = "INSERT INTO TRANSACTION_ITEM (TRANSID, ITEMID, AMOUNT) VALUES (" + transaction.id +","+item.id+","+item.amount+");";
                    using (SQLiteCommand insertCommand = new SQLiteCommand(query2, connection))
                    {
                        insertCommand.ExecuteNonQuery();
                    }
                }
                connection.Close();
            }
        }

        public static void dropCart(int userID)
        {
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();
                string query = "DELETE FROM CART WHERE USERID = " + userID + ";";
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

    }
}
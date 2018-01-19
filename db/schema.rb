# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180119074849) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                  default: "", null: false, collation: "utf8_general_ci"
    t.string   "encrypted_password",     default: "", null: false, collation: "utf8_general_ci"
    t.string   "reset_password_token",                             collation: "utf8_general_ci"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",                               collation: "utf8_general_ci"
    t.string   "last_sign_in_ip",                                  collation: "utf8_general_ci"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "brand_id"
    t.string "product_id"
  end

  create_table "cart_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "product_id",                                   collation: "utf8_general_ci"
    t.boolean  "has_logo"
    t.boolean  "has_emblem"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "cart_id"
    t.string   "size_id",                                      collation: "utf8_general_ci"
    t.string   "color_id",                                     collation: "utf8_general_ci"
    t.string   "state",                limit: 45,              collation: "utf8_general_ci"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.boolean  "is_active"
    t.integer  "n_products",                   default: 0
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "overall_user_id"
    t.string   "overall_user_type", limit: 45, default: "TempUser",              collation: "utf8_general_ci"
    t.string   "order_id",                                                       collation: "utf8_general_ci"
  end

  create_table "carts_gifts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "cart_id"
    t.string "gift_id"
  end

  create_table "carts_promotion_codes", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "cart_id",           limit: 11
    t.string "promotion_code_id", limit: 11
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active",     default: true
  end

  create_table "categories_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "category_id"
    t.string "product_id"
  end

  create_table "change_authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email"
    t.string   "code_authenticity"
    t.boolean  "used"
    t.datetime "limit"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "colors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.float    "price",        limit: 24
    t.string   "code_hex"
    t.integer  "stock"
    t.string   "product_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "preferred",               default: false
    t.string   "main_picture"
  end

  create_table "configuration_webs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.text     "value",        limit: 65535
    t.integer  "content_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "custom_emblems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "cart_product_id"
    t.string   "product_image_id"
    t.string   "color_id"
    t.string   "position_emblem_admin_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "custom_logos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "cart_product_id"
    t.string   "product_image_id"
    t.string   "color_id"
    t.string   "logo_id"
    t.decimal  "x",                precision: 10, scale: 5
    t.decimal  "y",                precision: 10, scale: 5
    t.decimal  "multiplexer",      precision: 10, scale: 5
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "emblems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "picture_file_name",                                collation: "utf8_general_ci"
    t.string   "picture_content_type",                             collation: "utf8_general_ci"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.decimal  "emblem_cost",          precision: 10
    t.decimal  "width",                precision: 10
    t.decimal  "height",               precision: 10
    t.decimal  "rel_x",                precision: 10
    t.decimal  "rel_y",                precision: 10
    t.string   "id_moltin",                                        collation: "utf8_general_ci"
  end

  create_table "galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       default: "", null: false, collation: "utf8_general_ci"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "product_id",                           collation: "utf8_general_ci"
  end

  create_table "gifts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "rate",           precision: 10, scale: 2
    t.string   "code"
    t.integer  "limit_usage"
    t.datetime "time_available"
    t.boolean  "used"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "group_showcases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "name_identity", limit: 65535,              collation: "utf8_general_ci"
    t.integer  "screen"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "max_count"
  end

  create_table "image_shows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name",                 collation: "utf8_general_ci"
    t.string   "image_content_type",              collation: "utf8_general_ci"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "showcase_id"
  end

  create_table "logos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.float    "price",                limit: 24
    t.string   "picture"
    t.string   "product_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "material_id"
    t.string "product_id"
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "ticket_it"
    t.text     "data",       limit: 65535
    t.boolean  "client"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "order_confirmations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "confirmation_token"
    t.boolean  "used"
    t.datetime "limit"
    t.string   "order_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "state",                                                        collation: "utf8_general_ci"
    t.text     "description",       limit: 65535,                              collation: "utf8_general_ci"
<<<<<<< HEAD
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
=======
>>>>>>> 390420771665cdee44725753343b8436c8e6ebbd
    t.string   "carrier",                                                      collation: "utf8_general_ci"
    t.string   "tracking_code",                                                collation: "utf8_general_ci"
    t.string   "overall_user_id",                                              collation: "utf8_general_ci"
    t.string   "overall_user_type",                                            collation: "utf8_general_ci"
    t.string   "charge_id",                                                    collation: "utf8_general_ci"
<<<<<<< HEAD
    t.string   "tag_link",                                                     collation: "utf8_general_ci"
    t.string   "user_address_id",                                              collation: "utf8_general_ci"
    t.boolean  "confirmed",                       default: false
=======
    t.boolean  "confirmed",                       default: false
    t.string   "tag_link",                                                     collation: "utf8_general_ci"
    t.string   "user_address_id",                                              collation: "utf8_general_ci"
    t.datetime "updated_at",                                      null: false
    t.datetime "created_at",                                      null: false
>>>>>>> 390420771665cdee44725753343b8436c8e6ebbd
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "image_file_name",                                collation: "utf8_general_ci"
    t.string   "image_content_type",                             collation: "utf8_general_ci"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "gallery_id"
    t.string   "color",                                          collation: "utf8_general_ci"
    t.string   "type",                                           collation: "utf8_general_ci"
    t.decimal  "price",              precision: 10
  end

  create_table "position_emblem_admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.decimal  "x",                    precision: 10, scale: 2
    t.decimal  "y",                    precision: 10, scale: 2
    t.decimal  "price",                precision: 10, scale: 2
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "title",                                                      collation: "utf8_general_ci"
    t.decimal  "multiplexer",          precision: 10, scale: 4
    t.integer  "color_id"
    t.integer  "product_id"
    t.string   "picture_file_name",                                          collation: "utf8_general_ci"
    t.string   "picture_content_type",                                       collation: "utf8_general_ci"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "product_image_id"
  end

  create_table "presets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "x",           precision: 10, scale: 2
    t.decimal  "y",           precision: 10, scale: 2
    t.decimal  "multiplexer", precision: 10, scale: 6
    t.string   "logo_id"
    t.string   "product_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "color_id"
    t.string   "picture_id"
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean  "main"
    t.string   "color_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.float    "price",            limit: 24
    t.boolean  "status"
    t.integer  "stock"
    t.string   "sku"
    t.text     "description",      limit: 65535
    t.string   "tax_band_id"
    t.string   "moltin_id"
    t.boolean  "customizable",                   default: false
    t.boolean  "emblemable",                     default: false
    t.boolean  "movable",                        default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "product_image_id"
  end

  create_table "products_styles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "product_id"
    t.string "style_id"
  end

  create_table "promotion_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.decimal  "rate",          precision: 10, scale: 2
    t.string   "code",                                                collation: "utf8_general_ci"
    t.integer  "limitUsage"
    t.datetime "timeAvailable"
    t.boolean  "used"
    t.datetime "updated_at",                             null: false
    t.datetime "created_at",                             null: false
  end

  create_table "relation_logos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "item_id",                  null: false, collation: "utf8_general_ci"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "left_margin",   limit: 24
    t.float    "top_margin",    limit: 24
    t.float    "right_margin",  limit: 24
    t.float    "bottom_margin", limit: 24
  end

  create_table "shipping_tag_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "order_id"
    t.string   "easy_post_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "showcases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "screen"
    t.boolean  "active"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "video_show_id"
    t.integer  "image_show_id"
    t.string   "product_id",                     collation: "utf8_general_ci"
    t.string   "url_association",                collation: "utf8_general_ci"
    t.integer  "group_showcase_id"
    t.string   "caption",                        collation: "utf8_general_ci"
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.float    "price",      limit: 24
    t.string   "product_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "styles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                   collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tax_bands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "titulo"
    t.decimal  "amount",                    precision: 10, scale: 3
    t.text     "description", limit: 65535
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.integer  "product_id"
    t.boolean  "active",                                             default: true
  end

  create_table "temp_user_controls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "auth_token",                collation: "utf8_general_ci"
    t.datetime "t_available"
    t.string   "temp_user_id",              collation: "utf8_general_ci"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "ip_address",                collation: "utf8_general_ci"
    t.boolean  "valid_token"
  end

  create_table "temp_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                   collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "temp_user_id"
    t.string   "subject"
    t.boolean  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "user_id",                        collation: "utf8_general_ci"
    t.string   "street_address",                 collation: "utf8_general_ci"
    t.string   "city",                           collation: "utf8_general_ci"
    t.string   "state",                          collation: "utf8_general_ci"
    t.string   "zip_code",                       collation: "utf8_general_ci"
    t.string   "area",                           collation: "utf8_general_ci"
    t.string   "number",                         collation: "utf8_general_ci"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "order_id",                       collation: "utf8_general_ci"
    t.string   "overall_user_id",                collation: "utf8_general_ci"
    t.string   "overall_user_type",              collation: "utf8_general_ci"
    t.string   "name",                           collation: "utf8_general_ci"
    t.string   "last_name",                      collation: "utf8_general_ci"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                  default: "", null: false, collation: "utf8_general_ci"
    t.string   "encrypted_password",     default: "", null: false, collation: "utf8_general_ci"
    t.string   "reset_password_token",                             collation: "utf8_general_ci"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",                               collation: "utf8_general_ci"
    t.string   "last_sign_in_ip",                                  collation: "utf8_general_ci"
    t.string   "confirmation_token",                               collation: "utf8_general_ci"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",                                collation: "utf8_general_ci"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "user_name",              default: "", null: false, collation: "utf8_general_ci"
    t.string   "user_last_name",         default: "", null: false, collation: "utf8_general_ci"
    t.string   "id_moltin",                                        collation: "utf8_general_ci"
    t.string   "c_stripe_id",                                      collation: "utf8_general_ci"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "video_shows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "video_file_name",                 collation: "utf8_general_ci"
    t.string   "video_content_type",              collation: "utf8_general_ci"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.integer  "showcase_id"
  end

end

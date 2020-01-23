# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_191_226_043_904) do
  create_table 'events', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'title'
    t.string 'address'
    t.float 'latitude'
    t.float 'longitude'
    t.string 'start_time'
    t.string 'end_time'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'capacity'
    t.integer 'participant'
    t.boolean 'holding', default: true, null: false
    t.integer 'organaizer'
  end

  create_table 'images', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'event_id'
    t.string 'image'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_images_on_event_id'
  end

  create_table 'relationships', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.integer 'following_id'
    t.integer 'follower_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'taggings', id: :integer, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.integer 'tag_id'
    t.string 'taggable_type'
    t.integer 'taggable_id'
    t.string 'tagger_type'
    t.integer 'tagger_id'
    t.string 'context', limit: 128
    t.datetime 'created_at'
    t.index ['context'], name: 'index_taggings_on_context'
    t.index %w[tag_id taggable_id taggable_type context tagger_id tagger_type], name: 'taggings_idx', unique: true
    t.index ['tag_id'], name: 'index_taggings_on_tag_id'
    t.index %w[taggable_id taggable_type context], name: 'taggings_taggable_context_idx'
    t.index %w[taggable_id taggable_type tagger_id context], name: 'taggings_idy'
    t.index ['taggable_id'], name: 'index_taggings_on_taggable_id'
    t.index ['taggable_type'], name: 'index_taggings_on_taggable_type'
    t.index %w[tagger_id tagger_type], name: 'index_taggings_on_tagger_id_and_tagger_type'
    t.index ['tagger_id'], name: 'index_taggings_on_tagger_id'
  end

  create_table 'tags', id: :integer, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name', collation: 'utf8_bin'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'taggings_count', default: 0
    t.index ['name'], name: 'index_tags_on_name', unique: true
  end

  create_table 'user_events', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_user_events_on_event_id'
    t.index ['user_id'], name: 'index_user_events_on_user_id'
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'nickname'
    t.text 'introduction'
    t.string 'icon'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'user_events', 'events'
  add_foreign_key 'user_events', 'users'
end

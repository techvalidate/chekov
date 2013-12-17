class AddIosAndAndroid < ActiveRecord::Migration
  def change
    add_column :assignments, :ios, :boolean, default: false
    add_column :assignments, :android, :boolean, default: false

    add_column :contexts, :ios, :boolean, default: false
    add_index  :contexts, :ios

    add_column :contexts, :android, :boolean, default: false
    add_index  :contexts, :android

    add_column :suites, :ios, :boolean, default: false
    add_index  :suites, :ios

    add_column :suites, :android, :boolean, default: false
    add_index  :suites, :android
  end
end

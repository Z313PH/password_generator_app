require 'rails_helper'

RSpec.describe PasswordsController, type: :controller do
    describe "#create" do
    it "generates a password and saves it to the database" do
        post :create, params: { length: 12, use_upper: true, use_numbers: true, use_special: true }

        expect(response).to redirect_to(
        a_string_matching(%r{\Ahttp://test.host/\?password=.*&strength=.*})
    )
    end
end

    describe "#destroy" do
    it "deletes the password from the database" do
        # Add a fake password entry manually
      fake_id = SecureRandom.uuid
      data = [
        { "id" => fake_id, "date" => "2025-04-12", "password" => "abc123", "strength" => "Weak" }
      ]
      File.write(Rails.root.join("Database", "db.json"), JSON.pretty_generate(data))

      delete :destroy, params: { id: fake_id }

      db = JSON.parse(File.read(Rails.root.join("Database", "db.json")))
      expect(db.none? { |entry| entry["id"] == fake_id }).to be true
    end
  end
end
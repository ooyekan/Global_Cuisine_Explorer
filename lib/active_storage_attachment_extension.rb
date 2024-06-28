# lib/active_storage_attachment_extension.rb

module ActiveStorageAttachmentExtension
  extend ActiveSupport::Concern

  class_methods do
    def ransackable_attributes(auth_object = nil)
      ["blob_id", "created_at", "id", "id_value", "name", "record_id", "record_type"]
    end
  end
end

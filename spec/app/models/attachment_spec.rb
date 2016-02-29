require 'rails_helper'

describe Attachment, type: :model do
  let(:attachment) { create :attachment }

  it 'belongs to an attachment polymorphic type' do
    expect(attachment).to belong_to :attachable
  end
end

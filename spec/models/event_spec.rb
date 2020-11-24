require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe '商品情報保存機能' do
    context '保存がうまくいくとき' do
      it '必須項目が全てあれば保存できること' do
        expect(@event).to be_valid
      end
      it 'priceがちょうど300の場合保存できる' do
        @event.price = 300
        expect(@event).to be_valid
      end
      it 'priceがちょうど99999の場合保存できる' do
        @event.price = 99_999
        expect(@event).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it 'productが空では保存できないこと' do
        @event.product = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Product can't be blank")
      end
      it 'introductionが空では保存できないこと' do
        @event.introduction = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'category_idが1だと保存できないこと' do
        @event.category_id = 1
        @event.valid?
        expect(@event.errors.full_messages).to include('Category must be other than 1')
      end
      it 'delivery_area_idが1だと保存できないこと' do
        @event.delivery_area_id = 1
        @event.valid?
        expect(@event.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it 'time_all_idが1だと保存できないこと' do
        @event.time_all_id = 1
        @event.valid?
        expect(@event.errors.full_messages).to include('Time all must be other than 1')
      end
      it 'priceが199の場合保存出来ない' do
        @event.price = 199
        @event.valid?
        expect(@event.errors.full_messages).to include('Price must be greater than or equal to 200')
      end
      it 'priceが100000の場合保存出来ない' do
        @event.price = 100_000
        @event.valid?
        expect(@event.errors.full_messages).to include('Price must be less than or equal to 99999')
      end
      it 'startが空の場合保存出来ない' do
        @event.start = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Start can't be blank")
      end  
      it 'userが紐付いていないと保存できないこと' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include('User must exist')
      end
      it 'time_startが空の場合保存出来ない' do
        @event.time_start = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Time start can't be blank")
      end  
    end
  end
end

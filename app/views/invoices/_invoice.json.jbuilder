json.extract! invoice, :id, :date, :sub_total, :tax, :total, :order_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)

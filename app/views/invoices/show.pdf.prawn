pdf.text "Invoice ##{@invoice.number}", :size => 30, :style => :bold
pdf.move_down(30)
lines = @invoice.invoice_lines.map do |invoice_line|
  [
        invoice_line.description,
        invoice_line.quantity,
        invoice_line.price,
  ]
end
pdf.table lines, :border_style => :grid,
  :row_colors => [ "FFFFFF", "DDDDDD" ],
  :headers => [ "Description", "Qty", "Price" ],
  :align => { 0 => :left, 1 => :right, 2 => :right }
  
pdf.move_down(10)
pdf.text "Total Amount Due: #{cents_to_dollars(@invoice.amount_due)}", :size => 16, :style => :bold
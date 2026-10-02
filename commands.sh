# Лабораторная работа №1: Вариант 13


# ======= 3aдание 1 =======
mkdir ~/lab0
cd ~/lab0

mkdir claude_monet
touch delivery_call

cd claude_monet
mkdir warehouse meat_delivery fish_delivery kitchen office

cd warehouse
touch stock_list rejection_log

cd ..
cd meat_delivery
touch senya_invoice supplier_note

cd ..
cd fish_delivery
touch fedya_invoice freshness_report

cd ..
cd kitchen
mkdir hot_station cold_station

cd hot_station
touch barinov_claim

cd ..
cd cold_station
touch fish_order

cd ..
cd ..
cd office
touch vika_payment
cd ..


cat > ~/lab0/claude_monet/warehouse/stock_list <<'EOF'
На складе осталось десять упаковок мяса
Свежая рыба размещена в холодильнике
Поставщик зелени ожидается вечером
EOF

cat > ~/lab0/claude_monet/warehouse/rejection_log <<'EOF'
Поставщик забрал коробку испорченных овощей
Две упаковки мяса отправлены на возврат
Баринов потребовал заменить продукты сегодня
EOF

cat > ~/lab0/claude_monet/meat_delivery/senya_invoice <<'EOF'
Говядина двадцать килограммов
Телятина десять килограммов
Поставщик мяса подтвердил вес заказа
EOF

cat > ~/lab0/claude_monet/meat_delivery/supplier_note <<'EOF'
Доставка мяса задержалась на сорок минут
Сеня принял продукты на складе
Следующий заказ привезут утром
EOF

cat > ~/lab0/claude_monet/fish_delivery/fedya_invoice <<'EOF'
Сибас двенадцать штук
Дорадо восемь штук
Поставщик рыбы добавил коробку льда
EOF

cat > ~/lab0/claude_monet/fish_delivery/freshness_report <<'EOF'
Рыба имеет свежий запах
Температура при доставке не нарушена
Федя разрешил использовать весь заказ
EOF

cat > ~/lab0/claude_monet/kitchen/hot_station/barinov_claim <<'EOF'
Баринов недоволен опозданием машины
Шеф требует проверять каждого поставщика
Качество продуктов важнее скидки
EOF

cat > ~/lab0/claude_monet/kitchen/cold_station/fish_order <<'EOF'
Для банкета требуется свежая рыба
Федя выбрал сибаса и дорадо
Заказ нужно передать Вике
EOF

cat > ~/lab0/claude_monet/office/vika_payment <<'EOF'
Вика получила накладные от Сени и Феди
Оплата поставщикам назначена на вечер
Возврат продуктов вычитается из суммы
EOF

cat > ~/lab0/delivery_call <<'EOF'
Поставщик позвонил перед открытием ресторана
Машина с продуктами стоит у входа
Лёва должен открыть склад
EOF


# ======= 3aдание 2 =======
chmod 755 ~/lab0/claude_monet
chmod u=rwx,g=rx,o=--- claude_monet/warehouse
chmod 640 claude_monet/warehouse/stock_list
chmod u=rw-,g=r--,o=--- claude_monet/warehouse/rejection_log
chmod 750 ~/lab0/claude_monet/meat_delivery
chmod u=rw-,g=r--,o=--- claude_monet/meat_delivery/senya_invoice
chmod 644 claude_monet/meat_delivery/supplier_note
chmod u=rwx,g=rx-,o=--- claude_monet/fish_delivery
chmod 640 claude_monet/fish_delivery/fedya_invoice
chmod u=rw-,g=r--,o=r-- claude_monet/fish_delivery/freshness_report
chmod 750 claude_monet/kitchen
chmod u=rwx,g=rx-,o=--- claude_monet/kitchen/hot_station
chmod 640 claude_monet/kitchen/hot_station/barinov_claim
chmod u=rwx,g=rx-,o=--- claude_monet/kitchen/cold_station
chmod 640 claude_monet/kitchen/cold_station/fish_order
chmod 750 claude_monet/office
chmod 640 claude_monet/office/vika_payment
chmod u=rw,g=r,o=--- delivery_call


# ======= 3aдание 3 =======
cp ~/lab0/delivery_call ~/lab0/claude_monet/office/call_copy

cp -r ~/lab0/claude_monet/fish_delivery ~/lab0/claude_monet/warehouse/fish_backup

ln -s ~/lab0/claude_monet/warehouse/stock_list ~/lab0/stock_link

ln -s ../warehouse ~/lab0/claude_monet/kitchen/warehouse_access

ln ~/lab0/claude_monet/meat_delivery/senya_invoice ~/lab0/claude_monet/meat_delivery/invoice_duplicate

cat ~/lab0/claude_monet/meat_delivery/senya_invoice ~/lab0/claude_monet/fish_delivery/fedya_invoice > ~/lab0/claude_monet/warehouse/all_invoices

cat ~/lab0/claude_monet/warehouse/rejection_log >> ~/lab0/claude_monet/kitchen/hot_station/barinov_claim

mv ~/lab0/claude_monet/kitchen/cold_station/fish_order ~/lab0/claude_monet/office/urgent_fish_order


# ======= 3aдание 4 =======
ls -lR ~/lab0 | grep '^-' | grep -v 'copy' | sort -k5 -n | tail -5

cat ~/lab0/claude_monet/*/* ~/lab0/claude_monet/*/*/* 2>/dev/null | grep -i 'поставщик\|продукт' | grep -v -i 'утром' | sort | head -6

grep -r -l -i 'рыб' ~/lab0/claude_monet/fish_delivery ~/lab0/claude_monet/warehouse/fish_backup | wc -l

tail -n 2 -q ~/lab0/claude_monet/meat_delivery/senya_invoice ~/lab0/claude_monet/fish_delivery/fedya_invoice | grep -i 'поставщик\|килограмм\|штук' | sort -r

grep -v -i 'поставщик' ~/lab0/claude_monet/warehouse/all_invoices | sort -r | head -3 | wc -w

find ~/lab0 -type f -links 2 -printf '%i %p\n' | sort -n

ls -lR ~/lab0 | grep '^l' | sort -k9 | tail -1


# ======= 3aдание 5 =======
rm claude_monet/office/call_copy
rm stock_link
rm claude_monet/kitchen/warehouse_access
rm claude_monet/meat_delivery/invoice_duplicate
rm claude_monet/office/urgent_fish_order
rmdir claude_monet/kitchen/cold_station
rm claude_monet/warehouse/rejection_log
rm -r claude_monet/warehouse/fish_backup

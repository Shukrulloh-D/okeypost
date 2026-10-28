#!/bin/bash
echo "🧹 Проверяем оставшиеся папки..."

# Просто пересоздаем папки для фичей, чтобы наверняка
mkdir -p src/features/login-form/ui
mkdir -p src/features/parcel-form/ui
mkdir -p src/features/change-password/ui
mkdir -p src/features/orders-filter/ui
mkdir -p src/features/delivery-calculator/ui
mkdir -p src/features/register-form/ui

# Просто пересоздаем папки для сущностей
mkdir -p src/entities/order-row/ui
mkdir -p src/entities/store-card/ui

echo "✅ Проверка завершена. Перезапускай сервер (Ctrl+C, npm run dev)."

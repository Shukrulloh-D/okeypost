#!/bin/bash
echo "🛠️ Добавляем недостающий компонент Select..."

# Создаем папку ui (на всякий случай)
mkdir -p src/shared/ui/select/ui

# 1. Компонент Select
cat > src/shared/ui/select/ui/select.jsx << 'END'
import './select.css';

export const Select = ({ label, options, register, error, ...props }) => (
  <div className="input-group">
    {label && <label>{label}</label>}
    <select className={error ? 'error' : ''} {...register} {...props}>
      <option value="">Выберите...</option>
      {options.map(opt => <option key={opt.value} value={opt.value}>{opt.label}</option>)}
    </select>
    {error && <span className="error-text">{error.message}</span>}
  </div>
);
END

# 2. Стили для Select (используем общие стили инпутов)
cat > src/shared/ui/select/ui/select.css << 'END'
.input-group select { 
  padding: 12px 16px; 
  border: 1px solid var(--border); 
  border-radius: 8px; 
  font-size: 14px; 
  outline: none; 
  background: #fff; 
  width: 100%; 
  cursor: pointer;
}
.input-group select:focus { 
  border-color: var(--primary-blue); 
}
.input-group select.error { 
  border-color: red; 
}
END

# 3. Экспорт
echo "export * from './ui/select';" > src/shared/ui/select/index.js

echo "✅ Компонент Select добавлен. Запускай npm run dev."

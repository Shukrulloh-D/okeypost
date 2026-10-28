#!/bin/bash
echo "🛠️ Безопасное восстановление UI-кита и файлов..."

# 1. ЖЕСТКО создаем папки ui внутри каждого компонента (чтобы cat не падал)
mkdir -p src/shared/ui/button/ui
mkdir -p src/shared/ui/input/ui
mkdir -p src/shared/ui/checkbox/ui
mkdir -p src/shared/ui/tabs/ui
mkdir -p src/shared/ui/select/ui

# 2. Восстанавливаем Button
cat > src/shared/ui/button/ui/button.jsx << 'END'
import './button.css';
export const Button = ({ children, variant = 'primary', className = '', ...props }) => (
  <button className={`btn btn-${variant} ${className}`} {...props}>{children}</button>
);
END
cat > src/shared/ui/button/ui/button.css << 'END'
.btn { padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; transition: 0.2s; display: inline-flex; justify-content: center; align-items: center; gap: 8px; }
.btn-primary { background: var(--primary-green); color: #fff; }
.btn-outline { border: 1px solid var(--primary-blue); color: var(--primary-blue); background: transparent; }
.btn-blue { background: var(--primary-blue); color: #fff; }
END
echo "export * from './ui/button';" > src/shared/ui/button/index.js

# 3. Восстанавливаем Input
cat > src/shared/ui/input/ui/input.jsx << 'END'
import './input.css';
export const Input = ({ label, error, register, ...props }) => (
  <div className="input-group">
    {label && <label>{label}</label>}
    <input className={error ? 'error' : ''} {...register} {...props} />
    {error && <span className="error-text">{error.message}</span>}
  </div>
);
END
cat > src/shared/ui/input/ui/input.css << 'END'
.input-group { display: flex; flex-direction: column; gap: 6px; margin-bottom: 16px; width: 100%; }
.input-group label { font-size: 14px; font-weight: 500; }
.input-group input { padding: 12px 16px; border: 1px solid var(--border); border-radius: 8px; font-size: 14px; outline: none; width: 100%; }
.input-group input.error { border-color: red; }
.error-text { color: red; font-size: 12px; }
END
echo "export * from './ui/input';" > src/shared/ui/input/index.js

# 4. Восстанавливаем Tabs
cat > src/shared/ui/tabs/ui/tabs.jsx << 'END'
import './tabs.css';
export const Tabs = ({ tabs, activeTab, onChange }) => (
  <div className="tabs-container">
    {tabs.map((tab) => <button key={tab.id} className={`tab-btn ${activeTab === tab.id ? 'active' : ''}`} onClick={() => onChange(tab.id)}>{tab.label}</button>)}
  </div>
);
END
cat > src/shared/ui/tabs/ui/tabs.css << 'END'
.tabs-container { display: flex; gap: 24px; border-bottom: 1px solid var(--border); margin-bottom: 24px; }
.tab-btn { padding: 12px 0; font-size: 16px; color: var(--text-muted); border-bottom: 2px solid transparent; }
.tab-btn.active { color: var(--primary-green); border-bottom-color: var(--primary-green); font-weight: 600; }
END
echo "export * from './ui/tabs';" > src/shared/ui/tabs/index.js

# 5. Создаем остальные папки (на случай если их нет)
mkdir -p src/features/auth/ui
mkdir -p src/features/edit-profile/ui
mkdir -p src/features/change-password/ui
mkdir -p src/features/create-parcel/ui
mkdir -p src/features/calculator/ui
mkdir -p src/entities/order-row/ui
mkdir -p src/entities/store-card/ui
mkdir -p src/entities/blog-card/ui
mkdir -p src/entities/notification-card/ui
mkdir -p src/pages/profile-page/ui/address-tab
mkdir -p src/pages/profile-page/ui/edit-tab
mkdir -p src/pages/profile-page/ui/password-tab
mkdir -p src/pages/profile-page/ui/payment-tab

echo "✅ Все базовые UI-компоненты и папки восстановлены."
echo "👉 Запускай npm run dev"

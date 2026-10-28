#!/bin/bash
echo "🛠️ Восстанавливаем UI-кит (создаем папки ui и файлы)..."

# ЖЕСТКО создаем папки ui для каждого компонента
mkdir -p src/shared/ui/button/ui
mkdir -p src/shared/ui/input/ui
mkdir -p src/shared/ui/select/ui
mkdir -p src/shared/ui/tabs/ui

# 1. BUTTON
cat > src/shared/ui/button/ui/button.jsx << 'END'
import './button.css';
export const Button = ({ children, variant = 'primary', className = '', ...props }) => (
  <button className={`btn btn-${variant} ${className}`} {...props}>{children}</button>
);
END
cat > src/shared/ui/button/ui/button.css << 'END'
.btn { padding: 12px 24px; border-radius: 8px; font-weight: 600; font-size: 14px; transition: 0.2s; display: inline-flex; align-items: center; justify-content: center; gap: 8px; }
.btn-primary { background: var(--primary-green); color: #fff; }
.btn-primary:hover { background: #009933; }
.btn-outline { border: 1px solid var(--primary-blue); color: var(--primary-blue); background: transparent; }
.btn-outline:hover { background: #e6f7ff; }
.btn-blue { background: var(--primary-blue); color: #fff; }
.btn:disabled { opacity: 0.5; cursor: not-allowed; }
END
echo "export * from './ui/button';" > src/shared/ui/button/index.js

# 2. INPUT
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
.input-group label { font-size: 14px; font-weight: 500; color: var(--text-main); }
.input-group input { padding: 12px 16px; border: 1px solid var(--border); border-radius: 8px; font-size: 14px; outline: none; transition: 0.2s; background: #fff; width: 100%; }
.input-group input:focus { border-color: var(--primary-blue); box-shadow: 0 0 0 3px rgba(64, 184, 234, 0.1); }
.input-group input.error { border-color: red; }
.error-text { color: red; font-size: 12px; }
END
echo "export * from './ui/input';" > src/shared/ui/input/index.js

# 3. SELECT
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
cat > src/shared/ui/select/ui/select.css << 'END'
.input-group select { padding: 12px 16px; border: 1px solid var(--border); border-radius: 8px; font-size: 14px; outline: none; background: #fff; width: 100%; cursor: pointer;}
.input-group select:focus { border-color: var(--primary-blue); }
END
echo "export * from './ui/select';" > src/shared/ui/select/index.js

# 4. TABS
cat > src/shared/ui/tabs/ui/tabs.jsx << 'END'
import './tabs.css';
export const Tabs = ({ tabs, activeTab, onChange }) => (
  <div className="tabs-container">
    {tabs.map((tab) => (
      <button key={tab.id} className={`tab-btn ${activeTab === tab.id ? 'active' : ''}`} onClick={() => onChange(tab.id)}>
        {tab.label}
      </button>
    ))}
  </div>
);
END
cat > src/shared/ui/tabs/ui/tabs.css << 'END'
.tabs-container { display: flex; gap: 24px; border-bottom: 1px solid var(--border); margin-bottom: 24px; }
.tab-btn { padding: 12px 0; font-size: 16px; color: var(--text-muted); border-bottom: 2px solid transparent; margin-bottom: -1px; transition: 0.2s; }
.tab-btn:hover { color: var(--primary-blue); }
.tab-btn.active { color: var(--primary-blue); border-bottom-color: var(--primary-blue); font-weight: 600; }
END
echo "export * from './ui/tabs';" > src/shared/ui/tabs/index.js

echo "✅ UI-кит готов!"

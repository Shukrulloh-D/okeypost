#!/bin/bash
echo "🛠️ Восстанавливаем Checkbox, Tabs и Select..."

# Checkbox
mkdir -p src/shared/ui/checkbox/ui
cat > src/shared/ui/checkbox/ui/checkbox.jsx << 'END'
import './checkbox.css';
export const Checkbox = ({ label, register, error, ...props }) => (
  <div className="checkbox-group">
    <label>
      <input type="checkbox" {...register} {...props} />
      <span>{label}</span>
    </label>
    {error && <span className="error-text">{error.message}</span>}
  </div>
);
END
cat > src/shared/ui/checkbox/ui/checkbox.css << 'END'
.checkbox-group { margin-bottom: 16px; }
.checkbox-group label { display: flex; align-items: center; gap: 10px; cursor: pointer; font-size: 14px; }
.checkbox-group input { width: 18px; height: 18px; accent-color: var(--primary-blue); }
END
echo "export * from './ui/checkbox';" > src/shared/ui/checkbox/index.js

# Tabs
mkdir -p src/shared/ui/tabs/ui
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
.tab-btn.active { color: var(--primary-blue); border-bottom-color: var(--primary-blue); font-weight: 600; }
END
echo "export * from './ui/tabs';" > src/shared/ui/tabs/index.js

# Select
mkdir -p src/shared/ui/select/ui
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

echo "✅ UI-кит полностью восстановлен. Перезапусти сервер (Ctrl+C -> npm run dev)."

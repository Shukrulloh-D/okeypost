#!/bin/bash
echo "🛠️ Фиксим экспорты, добавляем App.jsx и настраиваем Vite..."

# 1. Настройка алиасов в Vite (критически важно для @/)
cat > vite.config.js << 'END'
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import path from 'path';

export default defineConfig({
  plugins: [react()],
                            resolve: {
                              alias: {
                                '@': path.resolve(__dirname, './src'),
                              },
                            },
});
END

# 2. Создаем файлы index.js (Barrel files) для всех папок
# Pages
echo "export { default as HomePage } from './ui/home-page';" > src/pages/home-page/index.js
echo "export { default as LoginPage } from './ui/login-page';" > src/pages/login-page/index.js
echo "export { default as ProfilePage } from './ui/profile-page';" > src/pages/profile-page/index.js
echo "export { default as CreateParcelPage } from './ui/create-parcel-page';" > src/pages/create-parcel-page/index.js

# Widgets
echo "export { default as Header } from './ui/header';" > src/widgets/header/index.js
echo "export { default as Footer } from './ui/footer';" > src/widgets/footer/index.js

# Features
echo "export * from './ui/login-form';" > src/features/login-form/index.js
echo "export * from './ui/parcel-form';" > src/features/parcel-form/index.js

# Shared UI
echo "export * from './button';" > src/shared/ui/button/index.js
echo "export * from './input';" > src/shared/ui/input/index.js

# 3. Создаем App.jsx (чтобы было привычно)
cat > src/app/App.jsx << 'END'
import { RouterProvider } from 'react-router-dom';
import { router } from './router';

export default function App() {
  return <RouterProvider router={router} />;
}
END

# 4. Обновляем main.jsx
cat > src/main.jsx << 'END'
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './app/App';
import './app/styles/global.css';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
  <App />
  </React.StrictMode>,
);
END

# 5. Создаем папку для картинок (если нет)
mkdir -p public/images

# 6. Добавляем заглушки для друга (чтобы проект 100% запустился)
# Заглушка для HomePage (друг будет верстать тут)
cat > src/pages/home-page/ui/home-page.jsx << 'END'
import { Button } from '@/shared/ui/button';

export default function HomePage() {
  return (
    <div className="container mt-8">
    <h1 className="title-h1">Главная страница (Заглушка)</h1>
    <p className="mt-4 text-muted">Друг, тут ты верстаешь Hero-баннер и карточки магазинов.</p>
    <div style={{ marginTop: '20px', padding: '40px', background: '#fff', borderRadius: '16px', border: '1px dashed #ccc', textAlign: 'center' }}>
    <p>Место для баннера из Figma</p>
    </div>
    </div>
  );
}
END

echo "✅ ВСЁ ГОТОВО! Запускай 'npm run dev'"

import { Outlet, useNavigate, NavLink } from 'react-router-dom';
import { useAuthStore } from '@/shared/store/auth-store';
import { Button } from '@/shared/ui/button';
import { Clock, User } from 'lucide-react';
import './profile-page.css';

export default function ProfilePage() {
  const { user } = useAuthStore();
  const navigate = useNavigate();

  return (
    <div className="container page-wrapper">
      {/* Верхняя панель */}
      <div className="profile-top-bar bg-blue-gradient">
        <div className="top-info">
          <span><Clock size={16}/> Пн-Пт: 10:00-18:00</span>
          <span><User size={16}/> {user?.name || 'Dmitro Karlov'}</span>
        </div>
        <div className="top-balance">
          <span>Ваш баланс: 0.0 ₽</span>
          <Button style={{padding: '8px 16px', fontSize: 13}} onClick={() => navigate('/top-up')}>Пополнить баланс</Button>
          <div className="pay-logos">
            <img src="/images/icons/paypal.png" alt="PayPal" onError={(e)=>e.target.style.display='none'}/>
            <img src="/images/icons/visa.png" alt="Visa" onError={(e)=>e.target.style.display='none'}/>
          </div>
        </div>
      </div>

      {/* Навигация */}
      <div className="profile-nav">
        <NavLink to="/profile/address">Профиль</NavLink>
        <NavLink to="/orders">Заказы</NavLink>
        <NavLink to="/create-parcel">Посылки</NavLink>
        <NavLink to="/profile/payment">Транзакции</NavLink>
        <NavLink to="/address-book">Адресная книга</NavLink>
        <NavLink to="/notifications">Уведомления</NavLink>
      </div>

      {/* Карточка юзера */}
      <div className="card user-card mb-8 flex gap-8 items-center">
        <div className="user-avatar">
          <img src="/images/profile/avatar.png" alt="User" onError={(e)=>e.target.style.background='#ddd'}/>
        </div>
        <div className="user-info-grid">
          <div><span className="text-muted">Имя:</span> <b>Dmitro Karlov</b></div>
          <div><span className="text-muted">Логин:</span> <b>dmitro.karlov</b></div>
          <div><span className="text-muted">E-mail:</span> <b>dmitro.karlov@gmail.com</b></div>
          <div><span className="text-muted">Телефон:</span> <b>+38 098 898 99 66</b></div>
          <div style={{gridColumn: '1 / -1'}}><span className="text-muted">Адрес:</span> <b>Москва, Проспект Гоголя, 30/98</b></div>
        </div>
        <div className="user-actions">
          <Button onClick={() => navigate('/profile/edit')}>Редактировать</Button>
          <a href="#" className="text-primary-green text-sm mt-2 block text-center" onClick={(e)=>{e.preventDefault(); navigate('/profile/password')}}>Изменить пароль</a>
        </div>
      </div>

      {/* Вкладки и контент */}
      <div className="card p-0">
        <div className="profile-tabs">
          <NavLink to="/profile/address">Виртуальный адрес</NavLink>
          <NavLink to="/profile/info">Информация о работе</NavLink>
          <NavLink to="/profile/payment">Реквизиты для оплаты</NavLink>
        </div>
        <div className="p-8">
          <Outlet />
        </div>
      </div>
    </div>
  );
}

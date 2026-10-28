import { NavLink } from 'react-router-dom';
export default function ProfileSidebar() {
  return (
    <aside style={{ display: 'flex', flexDirection: 'column', gap: 8, background: '#fff', padding: 24, borderRadius: 16, width: 250, height: 'fit-content' }}>
      <NavLink to="/profile/address">Виртуальный адрес</NavLink><NavLink to="/profile/info">Информация о работе</NavLink><NavLink to="/profile/payment">Реквизиты для оплаты</NavLink>
      <NavLink to="/orders">Заказы</NavLink><NavLink to="/address-book">Адресная книга</NavLink><NavLink to="/notifications">Уведомления</NavLink>
    </aside>
  );
}

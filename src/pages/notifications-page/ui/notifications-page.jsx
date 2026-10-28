import { NotificationCard } from '@/entities/notification-card';
import { mockNotifications } from '@/shared/mock/data';
import { AlertTriangle } from 'lucide-react';
export default function NotificationsPage() {
  return (
    <div className="container page-wrapper" style={{ maxWidth: '1000px' }}>
      <h1 className="title-h1 mb-8">Уведомления</h1>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
        {mockNotifications.map(n => <NotificationCard key={n.id} n={n} />)}
      </div>
      <div style={{ background: '#fff', padding: '32px', borderRadius: '16px', border: '1px solid var(--border)', marginTop: '32px', display: 'flex', gap: '24px' }}>
        <div style={{ background: '#FFFBEB', padding: '12px', borderRadius: '50%', color: '#D97706' }}><AlertTriangle size={24} /></div>
        <div><h3 style={{ fontSize: '18px', marginBottom: '8px' }}>Про таможенные лимиты:</h3><p className="text-muted" style={{ fontSize: '14px', lineHeight: 1.6 }}>С 1 января 2020 года беспошлинный лимит в России составляет 200 евро. При превышении необходимо оплатить пошлину в размере 15% от суммы превышения.</p><button className="btn btn-primary mt-4">Подробнее</button></div>
      </div>
    </div>
  );
}
 
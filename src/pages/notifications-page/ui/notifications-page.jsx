import { mockNotifications } from '@/shared/mock/data';
import { AlertTriangle, Check } from 'lucide-react';
export default function NotificationsPage() {
  return (
    <div>
      <h2 className="title-h2 mb-8">Уведомления</h2>
      <div className="grid-2 mb-8">
        {mockNotifications.map(n => (
          <div key={n.id} className="card flex justify-between items-start">
            <div><h4 className="font-bold text-base mb-2">{n.title}</h4><p className="text-muted text-sm mb-3">{n.text}</p><span className="text-xs text-gray-400">{n.date}</span></div>
            <Check color="var(--primary-green)" size={24}/>
          </div>
        ))}
      </div>
      <div className="card border-l-4 border-red-500 flex gap-6 items-start">
        <div className="bg-red-50 p-3 rounded-full text-red-500"><AlertTriangle size={24}/></div>
        <div>
          <h3 className="font-bold text-lg mb-2">Про таможенные лимиты:</h3>
          <p className="text-muted text-sm leading-relaxed mb-2">С 1 января 2020 года беспошлинный лимит в России составляет 200 евро. Если стоимость посылки превышает этот лимит, она облагается налогом.</p>
          <p className="text-muted text-sm leading-relaxed mb-4">При превышении беспошлинного порога необходимо оплатить пошлину в размере 15% от суммы превышения, но не менее 2 евро за 1 кг.</p>
          <button className="btn btn-primary">Подробнее</button>
        </div>
      </div>
    </div>
  );
}

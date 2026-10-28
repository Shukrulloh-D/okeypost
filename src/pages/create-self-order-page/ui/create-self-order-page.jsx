import { useForm } from 'react-hook-form';
import { Button } from '@/shared/ui/button';
import { Input } from '@/shared/ui/input';
import { Link } from 'react-router-dom';
import { ArrowLeft } from 'lucide-react';

export default function CreateSelfOrderPage() {
  const { register, handleSubmit, formState: { errors } } = useForm();
  const onSubmit = (data) => { alert('Заказ сохранен: ' + data.track); };

  return (
    <div>
      <Link to="/orders" className="flex items-center gap-2 text-muted mb-6 text-sm hover:text-primary-blue">
        <ArrowLeft size={16}/> Назад к заказам
      </Link>
      <h2 className="title-h2 mb-2">Создание заказа, который Вы выполняете самостоятельно</h2>
      <p className="text-muted text-sm mb-8">Заполните форму для добавления заказа в систему.</p>

      <form onSubmit={handleSubmit(onSubmit)} className="bg-white p-8 rounded-2xl">
        <div className="grid-3">
          <Input label="Трек-номер*" register={register('track', { required: 'Введите трек-номер' })} placeholder="UK123456" error={errors.track}/>
          <Input label="Сумма заказа, £*" type="number" register={register('amount', { required: 'Введите сумму' })} placeholder="Введите сумму" error={errors.amount}/>
          <Input label="Магазин*" register={register('shop', { required: 'Укажите магазин' })} placeholder="Введите магазин" error={errors.shop}/>
        </div>
        <Button type="submit" className="mt-6">Сохранить</Button>
      </form>
    </div>
  );
}

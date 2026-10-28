import { useForm } from 'react-hook-form';
import { useState } from 'react';
import { Button } from '@/shared/ui/button';
import { Select } from '@/shared/ui/select';
import { SuccessModal } from '@/shared/ui/success-modal';

export default function CreateParcelPage() {
  const { register, handleSubmit } = useForm();
  const [showSuccess, setShowSuccess] = useState(false);

  const onSubmit = () => setShowSuccess(true);

  return (
    <>
      <div>
        <h2 className="title-h2 mb-8">Создание посылки</h2>
        <form onSubmit={handleSubmit(onSubmit)} className="card">
          <h3 className="text-lg font-bold mb-2">Заказы</h3>
          <p className="text-muted text-sm mb-6">Трек-номер заказа по которому получают посылку</p>
          
          <div className="grid-2 mb-6">
            <Select label="Выберите получателя:" options={[{value:'Dmitro', label:'Dmitro Karlov'}]} register={register('receiver')} />
            <Button type="button" variant="outline" style={{height: 48, marginTop: 24}}>Добавить нового получателя</Button>
          </div>

          <div className="grid-2 mb-8">
            <Select label="Выберите тип:" options={[{value:'standard', label:'Стандартный'}]} register={register('type')} />
            <Select label="Заказы:" options={[{value:'order1', label:'#12345 UK123456'}]} register={register('order')} />
          </div>

          <div className="grid-3 mb-8">
            <label className="flex items-center gap-2 text-sm"><input type="checkbox" {...register('consolidation')} style={{width:18, height:18}}/> Консолидация</label>
            <label className="flex items-center gap-2 text-sm"><input type="checkbox" {...register('removeBox')} style={{width:18, height:18}}/> Удаление коробок</label>
            <label className="flex items-center gap-2 text-sm"><input type="checkbox" {...register('additionalPack')} style={{width:18, height:18}}/> Дополнительная упаковка</label>
            <label className="flex items-center gap-2 text-sm"><input type="checkbox" {...register('film')} style={{width:18, height:18}}/> Пленка / скотч</label>
            <label className="flex items-center gap-2 text-sm"><input type="checkbox" {...register('declaration')} style={{width:18, height:18}}/> Заполнение декларации</label>
            <label className="flex items-center gap-2 text-sm"><input type="checkbox" {...register('valuation')} style={{width:18, height:18}}/> Оценка стоимости</label>
          </div>

          <Button type="submit">Создать посылку</Button>
        </form>
      </div>
      <SuccessModal isOpen={showSuccess} onClose={() => setShowSuccess(false)} title="Посылка создана!" message="Мы оповестим вас, когда она будет собрана." />
    </>
  );
}

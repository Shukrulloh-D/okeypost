export default function AddressTab() {
  return (
    <div>
      <h3 className="title-h2 mb-4">Ваш виртуальный адрес:</h3>
      <div style={{display: 'flex', flexDirection: 'column', gap: 4}}>
        {[ {l: 'Ваш ID Клиента:', v: 'OK5556A654654'}, {l: 'Name, Surname:', v: 'Karlov Dmitro OK5556A654654'}, {l: 'First line of address:', v: 'Unit 5 Cromwell Estate OK5556A654654'}, {l: 'Second line of address:', v: 'Staffa road UK07988'}, {l: 'Country:', v: 'London'}, {l: 'Postcode:', v: 'E10 7QE'}, {l: 'Town, City:', v: 'London'}, {l: 'Country:', v: 'Great Britain'}, {l: 'Telephone:', v: '0730882545'} ].map((row, i) => (
          <div key={i} style={{display: 'flex', background: '#F8FAFC', padding: '16px 24px', borderRadius: 8, fontSize: 14}}><span style={{width: 250, color: 'var(--text-muted)'}}>{row.l}</span><span>{row.v}</span></div>
        ))}
      </div>
    </div>
  );
}

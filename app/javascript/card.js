const pay = () => {
  //公開鍵
  Payjp.setPublicKey("pk_test_90f3616558ab5f7407f24e62")
  //
  //イベント発火submitされた時
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
  //
//フォームの情報を取得する
    const formResult = document.getElementById("charge-form")
    const formData = new FormData(formResult);

//card情報の取得(name属性の値)
    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`
    };
//カードの情報を送りトークン化する処理、cardには上記のカード情報、statusはトークン化されなかった時の情報、responseには返ってきた内容が含まれる
//HTTPステータスコードが200のとき、すなわちうまく処理が完了したときだけ、トークンの値を取得するように実装
    Payjp.createToken(card, (status, response) =>{
      if (status == 200) {
        const token = response.id;
      //tokenの情報をサーバーサイドに送る処理
        const renderDom = document.getElementById("charge-form")
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      //クレジットの情報を削除する
      document.getElementById("card-number").removeAttribute('name');
      document.getElementById("card-cvc").removeAttribute('name');
      document.getElementById("card-exp-month").removeAttribute('name');
      document.getElementById("card-exp-year").removeAttribute('name');

      //formの情報をサーバーサイドに送信、８行目(e.preventDefault();)でrailsにおけるform送信の処理はキャンセルされているため
      document.getElementById("charge-form").submit();
    })
  });
};

window.addEventListener("load", pay);

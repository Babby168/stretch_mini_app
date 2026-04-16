document.addEventListener('turbo:load', () => {
  console.log('タイマー機能の初期化を開始します');

  // 各要素を取得
  const timerDisplay = document.getElementById('timer-display');
  const startBtn = document.getElementById('start-btn');
  const stopBtn = document.getElementById('stop-btn');
  const completionMessage = document.getElementById('completion-message');

  console.log('Timer Display:', timerDisplay);
  console.log('Start Button:', startBtn);
  console.log('Stop Button:', stopBtn);
  console.log('Completion Message:', completionMessage);

  // 要素が取得できない場合は処理を中断
  if (!timerDisplay || !startBtn || !stopBtn || !completionMessage) {
    console.error('必要な要素が見つかりません');
    return;
  }

  // タイマーの設定
  let timeLeft = 60; // 60秒
  let timerInterval = null;

  // 初期状態：完了メッセージを非表示に設定
  completionMessage.style.display = 'none';
  // 初期状態：終了ボタンを非表示に設定
  stopBtn.style.display = 'none';
  console.log('初期状態を設定しました');

  console.log('タイマー機能の初期化が完了しました');

  // タイマー表示を更新する関数
  function updateDisplay() {
    const minutes = Math.floor(timeLeft / 60);
    const seconds = timeLeft % 60;
    timerDisplay.textContent = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
    console.log(`タイマー表示を更新しました: ${timerDisplay.textContent}`);
  }

  // カウントダウンを開始する関数
  function startTimer() {
    console.log('タイマーを開始します');
    
    // ボタンの表示を切り替え
    startBtn.style.display = 'none';  // スタートボタンを非表示
    stopBtn.style.display = 'block';  // 終了ボタンを表示
    console.log('ボタンの表示を切り替えました');

    // タイマーを開始
    timerInterval = setInterval(() => {
      timeLeft--;
      console.log(`残り時間: ${timeLeft}秒`);
      updateDisplay();

      // タイマーが0になったら終了
      if (timeLeft <= 0) {
        clearInterval(timerInterval);
        console.log('タイマーが終了しました');
        handleCompletion();
      }
    }, 1000);
  }

  // カウントダウンを停止する関数
  function stopTimer() {
    console.log('タイマーを停止します');
    clearInterval(timerInterval);
    
    // アラートを表示
    alert('お疲れ様でした！記録を登録してください。');
    console.log('アラートを表示しました');
    
    // 記録登録画面へ遷移
    redirectToRecordPage();
  }

  // カウントダウン完了時の処理
  function handleCompletion() {
    console.log('完了処理を実行します');
    
    // 完了メッセージを表示
    completionMessage.style.display = 'block';
    console.log('完了メッセージを表示しました');

    // 2秒後に記録画面へ遷移
    setTimeout(() => {
      console.log('記録登録画面へ遷移します');
      redirectToRecordPage();
    }, 2000);
  }

  // 記録登録画面へ遷移する関数
  function redirectToRecordPage() {
    const stretchId = timerDisplay.dataset.stretchId;
    console.log(`Stretch ID: ${stretchId}`);
    
    if (stretchId) {
      window.location.href = `/stretches/${stretchId}/records/new`;
    } else {
      console.error('Stretch ID が見つかりません');
    }
  }

  // イベントリスナーを設定
  startBtn.addEventListener('click', () => {
    console.log('スタートボタンがクリックされました');
    startTimer();
  });

  stopBtn.addEventListener('click', () => {
    console.log('終了ボタンがクリックされました');
    stopTimer();
  });
});

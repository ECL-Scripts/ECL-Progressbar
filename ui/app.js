window.addEventListener('message', function(event) {

    const data = event.data;

    if (data.action === 'progress') {

        createProgress(data);

    }

    if (data.action === 'cancel') {

        removeProgress();

    }

});

function createProgress(data) {

    const container = document.getElementById('progress-container');

    container.innerHTML = '';

    const progress = document.createElement('div');

    progress.classList.add('progress-wrapper');

    progress.innerHTML = `

        <div class="progress-content">

            <div class="progress-label">
                ${data.label}
            </div>

            <div class="progress-bar">

                <div class="progress-fill"
                    style="
                    background: ${data.color};
                    animation: progressFill ${data.duration}ms linear forwards;
                ">
                </div>
            </div>

        </div>
    `;

    container.appendChild(progress);

    setTimeout(() => {

        progress.classList.add('progress-out');

        setTimeout(() => {

            progress.remove();

        }, 300);

    }, data.duration);

}

function removeProgress() {

    const progress = document.querySelector('.progress-wrapper');

    if (!progress) return;

    progress.classList.add('progress-out');

    setTimeout(() => {

        progress.remove();

    }, 300);

}
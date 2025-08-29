window.addEventListener('load', function() {
    const gearDisplay = document.getElementById('gear-display');
    const currentGear = document.getElementById('current-gear');
    
    // Position the display based on config
    function setPosition(loc, custom) {
        switch(loc) {
            case 'top-right':
                gearDisplay.style.top = '20px';
                gearDisplay.style.right = '20px';
                break;
            case 'top-left':
                gearDisplay.style.top = '20px';
                gearDisplay.style.left = '20px';
                break;
            case 'custom':
                gearDisplay.style.top = custom.top + '%';
                gearDisplay.style.right = custom.right + '%';
                break;
        }
    }
    window.addEventListener('message', function(event) {
        const data = event.data;
        
        if (data.type === 'updateGear') {
            currentGear.textContent = data.gear;
            currentGear.classList.toggle('warning', data.isOverRPM);
        } else if (data.type === 'setPosition') {
            setPosition(data.location, data.custom);
            gearDisplay.style.display = 'block';
        } else if (data.type === 'hideUI') {
            gearDisplay.style.display = 'none';
        }
    });
});
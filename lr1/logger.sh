output="lb1.log"
user="alex@rumeftw:~/university/os/lr1$"

if [ $# -eq 0 ]; then 
	./cleanup.sh
	script -q -c "$0 run" "$output"
	exit
fi

echo -e "Отчёт выполнен $(date)\n"

echo -e "Лабораторная работа №1\n"
echo -e "Львов Александр Васильевич 3342\n"

echo -e "Информация о процессоре\n"
echo -e "$user lscpu"
lscpu
echo

echo -e "Информация о системе\n"
echo -e "$user uname -a"
uname -a
echo

echo -e "Задание 1\n"
echo -e "$user ./1.sh 1.log"
./1.sh 1.log
echo -e "$user cat 1.log"
cat 1.log

echo -e "Задание 2\n"
echo -e "$user ln 1.sh hardlink"
ln 1.sh hardlink
echo -e "$user ./2.sh 1.sh"
./2.sh 1.sh
echo -e "$user cat 2.log"
cat 2.log

echo -e "Задание 3\n"
echo -e "$user ln -s asdfile softlink"
ln -s asdfile softlink
echo -e "$user ./3.sh asdfile"
./3.sh asdfile
echo -e "$user cat 3.log"
cat 3.log

echo -e "Задание 4\n"
echo -e "$user ./4.sh asdfile"
./4.sh asdfile
echo -e "$user cat 4.log"
cat 4.log

echo -e "Задание 5\n"

for i in "b" "d" "c" "f" "l" "p" "s"; do 
	echo -e "$user find / -type $i 2>/dev/null | xargs ls -l 2>/dev/null | head -n 2"
	find / -type $i 2>/dev/null | xargs ls -l 2>/dev/null | head -n 2 
done
echo

echo -e "Задание 6\n"
echo "$user od -c /home/alex/university/pr/2-sem/img/bmp_24.bmp | head -n 10"
od -c /home/alex/university/pr/2-sem/img/bmp_24.bmp | head -n 10
echo "$user od -A x -t x1z -v 1.log"
od -A x -t x1z -v 1.log
echo "$user hexdump -C /home/alex/university/pr/2-sem/img/bmp_24.bmp | head -n 10"
hexdump -C /home/alex/university/pr/2-sem/img/bmp_24.bmp | head -n 10
echo "$user hexdump -C 1.log"
hexdump -C 1.log
echo

echo -e "Задание 7\n"
echo -e "$user ./7.sh"
./7.sh
echo

echo -e "Задание 8\n"
echo -e "$user ls -l /etc/passwd && stat /etc/passwd && head -n 10 /etc/passwd"
ls -l /etc/passwd && head -n 10 /etc/passwd
echo "$user ls -l /etc/shadow && stat /etc/passwd && sudo head -n 10 /etc/shadow"
ls -l /etc/shadow && sudo head -n 10 /etc/shadow
echo "$user ls -l /usr/bin/passwd && stat /usr/bin/passwd"
ls -l /usr/bin/passwd && stat /usr/bin/passwd
echo

echo -e "Задание 9\n"
echo -e "$user ls"
ls

echo "$user mkdir dir9"
mkdir dir9
echo -e "$user ls -l"
ls -l

echo "$user sudo chmod 000 dir9"
sudo chmod 000 dir9

echo "$user ls -l | grep dir9"
ls -l | grep dir9

echo "$user sudo chmod 741 dir9"
sudo chmod 741 dir9

echo "$user ls -l | grep dir9"
ls -l | grep dir9

echo "$user sudo useradd testuser1"
sudo useradd testuser1

echo "$user sudo cat /etc/passwd | grep testuser1"
sudo cat /etc/passwd | grep testuser1

echo "$user sudo chown testuser1 dir9/"
sudo chown testuser1 dir9/

echo "$user ls -l | grep dir9"
ls -l | grep dir9

echo "$user sudo chown alex dir9/"
sudo chown alex dir9/

echo "$user touch dir9/file && ls -l dir9"
touch dir9/file && ls -l dir9

echo "$user sudo chmod u+s dir9/file"
sudo chmod u+s dir9/file

echo "$user ls -l dir9"
ls -l dir9

echo "$user sudo groupadd testgroup && sudo usermod -aG testgroup testuser1 && groups testuser1"
sudo groupadd testgroup && sudo usermod -aG testgroup testuser1 && groups testuser1

echo "$user touch dir9/newfile && ls -l dir9"
touch dir9/newfile && ls -l dir9

echo "$user sudo chown testuser1:testgroup dir9/newfile && ls -l dir9"
sudo chown testuser1:testgroup dir9/newfile && ls -l dir9

echo "$user echo "message" > dir9/newfile"
echo "message" > dir9/newfile

echo "$user sudo usermod -aG testgroup alex && groups alex"
sudo usermod -aG testgroup alex && groups alex

echo "$user echo "message" > dir9/newfile && cat dir9/newfile"
sudo su alex -c "echo message > dir9/newfile" && cat dir9/newfile

echo -e "9.4\n"
echo "$user ls -l dir9"
ls -l dir9

echo "$user touch dir9/file94 && ls -l dir9"
touch dir9/file94 && ls -l dir9

echo "$user sudo chmod 000 dir9/file94 && ls -l dir9 | grep file94"
sudo chmod 000 dir9/file94 && ls -l dir9 | grep file94

echo "$user cat dir9/file94"
cat dir9/file94

echo "$user sudo chmod 200 dir9/file94 && ls -l dir9 | grep file94"
sudo chmod 200 dir9/file94 && ls -l dir9 | grep file94

echo "$user echo "Hello" > dir9/file94"
echo "Hello" > dir9/file94

echo "$user sudo chmod 400 dir9/file94 && ls -l dir9 | grep file94"
sudo chmod 400 dir9/file94 && ls -l dir9 | grep file94

echo "$user cat dir9/file94"
cat dir9/file94

echo -e "Задание 10\n"
echo "$user sudo chown testuser1:testgroup dir9/file94 && ls -l dir9 | grep file94"
sudo chown testuser1:testgroup dir9/file94 && ls -l dir9 | grep file94

echo "$user gcc 10.c -o gateway && ./gateway dir9/file94"
gcc 10.c -o gateway && ./gateway dir9/file94

echo "$user sudo chown root:root gateway"
sudo chown root:root gateway

echo "$user sudo chmod u+s gateway && ls -l | grep gateway"
sudo chmod u+s gateway && ls -l | grep gateway

echo "$user ./gateway dir9/file94"
./gateway dir9/file94

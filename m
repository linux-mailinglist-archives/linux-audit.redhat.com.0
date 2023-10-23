Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C657D3DEA
	for <lists+linux-audit@lfdr.de>; Mon, 23 Oct 2023 19:38:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698082686;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sxdbM/MDKGD2wNuNP0wIRs77krxKoa3YrFQ70kUMS7s=;
	b=DZAnKzNCZMeo96BvypV86qj8cqDP7IYcSuSXvPoaBDWYWMYyTT7c4fdAUTh21UjATRkPD5
	t3uKLXx65aIuy6Gz+Q8GyIHOfXbcfsTXBf/zCBbUYxPtbYuPE0wD39hehp7fHrKIESyfhp
	EPn4/yLXrB426Z2nzlzOgG2F8cBseGE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-02lKQoQJOcOpW7pkxe-AHg-1; Mon, 23 Oct 2023 13:37:53 -0400
X-MC-Unique: 02lKQoQJOcOpW7pkxe-AHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CB643C1045D;
	Mon, 23 Oct 2023 17:37:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B9AC1121320;
	Mon, 23 Oct 2023 17:37:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 30EA21946595;
	Mon, 23 Oct 2023 17:37:45 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 015DF1946588 for <linux-audit@listman.corp.redhat.com>;
 Mon, 23 Oct 2023 17:37:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D408B1C060B6; Mon, 23 Oct 2023 17:37:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC7AD1C060AE
 for <linux-audit@redhat.com>; Mon, 23 Oct 2023 17:37:43 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F9D1857F8C
 for <linux-audit@redhat.com>; Mon, 23 Oct 2023 17:37:43 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-wNXHQimIPuWBEm8v8EaumQ-1; Mon, 23 Oct 2023 13:37:39 -0400
X-MC-Unique: wNXHQimIPuWBEm8v8EaumQ-1
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2c523ac38fbso52568571fa.0; 
 Mon, 23 Oct 2023 10:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698082656; x=1698687456;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nUeUmPKOjobLWYCEk1pKpn9LFrJOrztr1vGA0Ix3lSU=;
 b=Nf/VCGeLhvcoyP9ac+pSpMCLEOKKb/25L4zNkh1nczTdOfAo+QwVj2rLWR2yTjGYSb
 4Xz8cRnQrtsSOAV+VB+FZA7ieki2kmC0msrs12JgNjwgnUkgSohXgXVOPc5SA7F7+f41
 3tmZvUQx2n20H5aRCIEeixHoKR8yyyHCN2WMfQZMBUWkYsvlo90whhO8RByK+PMGtfq+
 GY3zVWR1FcHmnaSijyuq8BsrBloSaBTZHaQJBqyDdlDtcw8bPMJkZdsRyQf0qPRPjtQx
 uCyhe5k4q3V7gTyNyl9jIYvluGsG7iZOSAOMaTgOWtD+SlPbsm8zIgsUyOgraKDs3lFE
 onZg==
X-Gm-Message-State: AOJu0YwqHYy41VspPdj7526XryXoZIX381xKuAtPihW6sU3U37Am2fby
 O+9tqfPeRMfne02g39754GuoI/gyRo0=
X-Google-Smtp-Source: AGHT+IEs9I4WYgFHKefSx2Ice7UiJnKFmMbsyRyrS0eI8AduKk1J5CBQERwWfOxvX0y/04it9tLMRA==
X-Received: by 2002:a2e:9658:0:b0:2c5:16c0:6239 with SMTP id
 z24-20020a2e9658000000b002c516c06239mr7091704ljh.51.1698082656020; 
 Mon, 23 Oct 2023 10:37:36 -0700 (PDT)
Received: from [192.168.0.31] ([94.242.171.26])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a2e9555000000b002c1277c15basm1671362ljh.93.2023.10.23.10.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 10:37:35 -0700 (PDT)
Message-ID: <88fd70f2-28c6-447a-aef9-5b82f1ef476b@gmail.com>
Date: Mon, 23 Oct 2023 20:37:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Couldn't get audit messages for 'listen' on kernel
 4.19.0-6-686-pae
To: Steve Grubb <sgrubb@redhat.com>
References: <0c22c924-2c1d-4a4f-a4f2-ea477999c8a4@kaspersky.com>
 <d1d9dd09-3c95-4488-ba05-f2d655895a2c@gmail.com>
 <adc9e0a6-80fe-4e81-bd10-8bfe323645bc@gmail.com> <4527815.LvFx2qVVIh@x2>
From: Rinat Gadelshin <rgadelsh@gmail.com>
In-Reply-To: <4527815.LvFx2qVVIh@x2>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Steve, thank you so much!

You've saved my life =)

Best regards
Rinat.

On 23.10.2023 19:19, Steve Grubb wrote:
> On Monday, October 23, 2023 9:06:16 AM EDT Rinat Gadelshin wrote:
>> Hello there!
>>
>> First of all, I have to apologize for two identical emails as the
>> beginning of the stream.
>> The first one was sent (by occasional) from my work email.
>> I've received notification, from the mail bot, that I should subscribe
>> to the mail list (for the work email).
>> After that I've resent the second one.
>>
>> Let's return to the problem.
>>
>> I've done a following experiment:
>>
>> `auditctl -D`
>> `auditctl -a always,exit -S all`
>> `strace netcat -v -l -p 4242 | tee strace.log` # the pid of the netcat
>> was 536
>> Ctrl+c
>> `ausearch -p 536 > auditd.pid.536.log`
>> `grep "syscall=.*traditional" auditd.pid.536.log | awk '{print $4}' |
>> sort | uniq -c'
>>
>> The last command prints the following result:
>>
>>        11 syscall=102
>>         1 syscall=11
>>         6 syscall=125
>>         6 syscall=140
>>         6 syscall=174
>>         1 syscall=175
>>        14 syscall=192
>>        33 syscall=195
>>         9 syscall=197
>>         2 syscall=20
>>         1 syscall=243
>>         1 syscall=27
>>        41 syscall=295
>>        14 syscall=3
>>         5 syscall=33
>>         2 syscall=4
>>         5 syscall=45
>>        11 syscall=6
>>         3 syscall=91
>>
>> So the following syscalls are reported (there are no `socket`, `bind`,
>> `connect`, `listen`):
>>
>>       3 (read)
>>       4 (write)
>>       6 (close)
>>       11 (execve)
>>       20 (getpid)
>>       27 (alarm)
>>       33 (access)
>>       45 (brk)
>>       91 (munmap)
>>     102 (socketcall)
> On old 386 kernels, they use socketcall as the networking API. Glibc under
> the hood sets arg0 to a number which represents the actual functionality to
> call and calls socketcall. You could say it multiplexes the network API.
> Somewhere along the way, they decided to modernize and make actual calls for
> each network function. So, if you have an audit library that is much newer
> than the kernel, it will assume you are using the updated API rather than the
> socketcall based API. In this case, you have an old glibc which still uses
> socketcall.
>
> So, if you wanted to audit socket, bind, connect, and listen you would use:
>
>   -a always,exit -F arch=b32 -S socketcall -F arg0=1 -F key=socket
>   -a always,exit -F arch=b32 -S socketcall -F arg0=2 -F key=bind
>   -a always,exit -F arch=b32 -S socketcall -F arg0=3 -F key=connect
>   -a always,exit -F arch=b32 -S socketcall -F arg0=4 -F key=listen
>
> A listing of the numbers to use can be found at:
> /usr/include/linux/net.h
>
> Hope this helps...
>
> -Steve
>
>>     125 (mprotect)
>>     140 (_llseek)
>>     174 (rt_sigaction)
>>     175 (rt_sigprocmask)
>>     192 (mmap2)
>>     195 (stat64)
>>     197 (fstat64)
>>     243 (set_thread_area)
>>     295 (openat)
>>
>> But strace's log shows that `socket`, `bind`, `connect` and `listen`
>> were called:
>>
>>       execve("/usr/bin/netcat", ["netcat", "-v", "-l", "-p", "4242"],
>> 0xbf9f8f00 /* 22 vars */) = 0
>>       -- line skipped --
>>       socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
>>       connect(3, {sa_family=AF_UNIX, sun_path="/var/run/nscd/socket"},
>> 110) = -1 ENOENT (No such file or directory)
>>       close(3)                                = 0
>>       -- line skipped --
>>       socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
>>       connect(3, {sa_family=AF_UNIX, sun_path="/var/run/nscd/socket"},
>> 110) = -1 ENOENT (No such file or directory)
>>       close(3)                                = 0
>>       -- line skipped --
>>       socket(AF_INET, SOCK_STREAM, IPPROTO_TCP) = 3
>>       setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
>>       setsockopt(3, SOL_SOCKET, SO_REUSEPORT, [1], 4) = 0
>>       bind(3, {sa_family=AF_INET, sin_port=htons(4242),
>> sin_addr=inet_addr("0.0.0.0")}, 16) = 0
>>       listen(3, 1)                            = 0
>>       getsockname(3, {sa_family=AF_INET, sin_port=htons(4242),
>> sin_addr=inet_addr("0.0.0.0")}, [16]) = 0
>>       -- line skipped --
>>
>> Please, give me a clue! How could it be?
>>
>> Best regards
>> Rinat
>>
>> On 22.10.2023 08:27, Rinat Gadelshin wrote:
>>> Hello there!
>>>
>>> I'm facing a strange problem.
>>> I have not been able to get audit reports for any "network" syscall
>>> on one of the computers from my test bench.
>>> I mean 'connect', 'accept4', 'listen', 'bind', 'socket'.
>>> The following example shows that auditd couldn't get them too
>>> ('listen' at least).
>>> But I've received a report about 'execve' called by the same process.
>>>
>>> Could you tell me what can I do in order to receive audit messages for
>>> the syscalls.
>>> from this version of the kernel?
>>>
>>> Any help will be will be appreciated.
>>>
>>>
>>> root@deb101-x86-0009:~# netcat -v -l -p 4242 &
>>> [2] 13481
>>> root@deb101-x86-0009:~# listening on [any] 4242 ...
>>> root@deb101-x86-0009:~# echo "Test" | nc -q 0 127.0.0.1 4242
>>> connect to [127.0.0.1] from localhost [127.0.0.1] 36650
>>> Test
>>> root@deb101-x86-0009:~# skill -p 13481
>>> [2]+  Done                    netcat -v -l -p 4242
>>> root@deb101-x86-0009:~# ausearch -p 13481
>>> ----
>>> time->Fri Oct 20 22:00:42 2023
>>> type=PROCTITLE msg=audit(1697828442.603:2697):
>>> proctitle=6E6574636174002D76002D6C002D700034323432
>>> type=PATH msg=audit(1697828442.603:2697): item=1
>>> name="/lib/ld-linux.so.2" inode=655382 dev=fe:00 mode=0100755 ouid=0
>>> ogid=0 rdev=00:00 nametype=NORMAL cap_fp=0000000000000000
>>> cap_fi=0000000000000000 cap_fe=0 cap_fver=0
>>> type=PATH msg=audit(1697828442.603:2697): item=0
>>> name="/usr/bin/netcat" inode=664887 dev=fe:00 mode=0100755 ouid=0
>>> ogid=0 rdev=00:00 nametype=NORMAL cap_fp=0000000000000000
>>> cap_fi=0000000000000000 cap_fe=0 cap_fver=0
>>> type=CWD msg=audit(1697828442.603:2697): cwd="/root"
>>> type=EXECVE msg=audit(1697828442.603:2697): argc=5 a0="netcat" a1="-v"
>>> a2="-l" a3="-p" a4="4242"
>>> type=SYSCALL msg=audit(1697828442.603:2697): arch=40000003 syscall=11
>>> success=yes exit=0 a0=e36400 a1=d9d9e0 a2=e3a310 a3=584988 items=2
>>> ppid=12968 pid=13481 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0
>>> sgid=0 fsgid=0 tty=pts1 ses=4 comm="netcat"
>>> exe="/usr/bin/nc.traditional" subj==unconfined key=(null)
>>> root@deb101-x86-0009:~# auditctl -l
>>> -a always,exit -F arch=b32 -S fork,execve,clone,vfork,execveat
>>> -a always,exit -F arch=b32 -S bind,connect,listen,accept4
>>> root@deb101-x86-0009:~# auditctl -s
>>> enabled 1
>>> failure 1
>>> pid 13393
>>> rate_limit 0
>>> backlog_limit 8192
>>> lost 0
>>> backlog 0
>>> backlog_wait_time 0
>>> loginuid_immutable 0 unlocked
>>> root@deb101-x86-0009:~# uname -a
>>> Linux deb101-x86-0009.avp.ru.local 4.19.0-6-686-pae #1 SMP Debian
>>> 4.19.67-2+deb10u2 (2019-11-11) i686 GNU/Linux
>>> root@deb101-x86-0009:~# cat /etc/debian_version
>>> 10.1
>>> root@deb101-x86-0009:~#
>>>
>>>
>>> Regards
>>> Rinat
>> --
>> Linux-audit mailing list
>> Linux-audit@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-audit
>
>
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


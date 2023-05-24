Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513B70F56D
	for <lists+linux-audit@lfdr.de>; Wed, 24 May 2023 13:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684928291;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OkEwKuZfH90MP1IZvBEw8jfw5asfjtNlfvSz0t46RZw=;
	b=g6980DRo7XLXP/6lbj9+lowDqqzRmjlp37EJr/e0X3QrhrJkEOYpSPKNeYOFgw13v+2MIU
	UIzsPJe4aRgry8jatE4Y9SL1VPIsDHw8N3xOLnVZ9Tn/yfSApYL6hfhueYxxXPWJRsOrn1
	Lse1sShIyyQRf6vfxVER9X0jt7eI/Mg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-9vvYsjkANruODHoVd_Wtsg-1; Wed, 24 May 2023 07:38:07 -0400
X-MC-Unique: 9vvYsjkANruODHoVd_Wtsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5A14101A53A;
	Wed, 24 May 2023 11:38:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5585C140E95D;
	Wed, 24 May 2023 11:37:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9927819465B9;
	Wed, 24 May 2023 11:37:57 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6ECF019465A8 for <linux-audit@listman.corp.redhat.com>;
 Wed, 24 May 2023 11:37:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 55CBC2166B26; Wed, 24 May 2023 11:37:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C9A92166B25
 for <linux-audit@redhat.com>; Wed, 24 May 2023 11:37:33 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27F59800159
 for <linux-audit@redhat.com>; Wed, 24 May 2023 11:37:33 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-3S4vTMWUOtCrGkYD3OyK7w-1; Wed, 24 May 2023 07:37:30 -0400
X-MC-Unique: 3S4vTMWUOtCrGkYD3OyK7w-1
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-4f37b860173so802274e87.2
 for <linux-audit@redhat.com>; Wed, 24 May 2023 04:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684928248; x=1687520248;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9vr6//6AMhQmMq7Ipt/o5aA6gaMHLtvyO7iK3eSQGiY=;
 b=Ky6imWLWvYvysGnFadcUylq/fO1UjPKyNau3wyWT3fXeJUa2ZFp44BszcEyA+PoCVq
 +gbq3uXHpxO6YYSjIU2q/KPG4O8Hnav8mAr+ZJjj9BqCcAaNChlmd/SOuyIp/ygl5SHM
 DINgHns11FZb9P1FpA7WNTm0Q5FIru394/iNFcx01abAin6eVLX5cdM0eepMPVgNaWsg
 i9sxd/qpVtJbDbW2C8SXsT3NpXtBK9ctPPB0CQxhaJf5y1ecopbSaD7LdGn3y7NhlVbf
 /B68e1dL+GUETqfXThWnHcogrj+CmLJhAi/J681ymp25fAVlMAvGeAoQ6VuSSleVqyqq
 IRgg==
X-Gm-Message-State: AC+VfDxyqCul0ksvRVt4og1Y1V+qnrVRJj5ancyNjtrQGwzgwjLQlVBg
 4Ca1YQQt6dnm4MWWXfeV51m0HakK3nVkEg==
X-Google-Smtp-Source: ACHHUZ4/IVliRQ0C5P9g6J5Cs/0+9WOEJP23ZhxklzoYIaX3pHzY07bLXcOhF9PzHeolM4QqwcPqdg==
X-Received: by 2002:ac2:5a4c:0:b0:4f1:4e95:119a with SMTP id
 r12-20020ac25a4c000000b004f14e95119amr4856253lfn.12.1684928247999; 
 Wed, 24 May 2023 04:37:27 -0700 (PDT)
Received: from [192.168.0.31] ([94.242.171.185])
 by smtp.gmail.com with ESMTPSA id
 d20-20020ac25454000000b004f4b3e9e0cesm901441lfn.297.2023.05.24.04.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 04:37:27 -0700 (PDT)
Message-ID: <b5e87a11-7605-6745-516a-8004569bbe5d@gmail.com>
Date: Wed, 24 May 2023 14:37:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: linux-audit@redhat.com
From: Rinat Gadelshin <rgadelsh@gmail.com>
Subject: Auditd doesn't receive syscalls after installation for the current
 shell.
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: audit@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello there.

It seems that the kernel doesn't send messages for syscalls of the shell 
process from which auditd is installed.

Reproducing steps (performed on Ubuntu 22.04 x86_64 on virtual box by 
`root`):

step #1: $ apt install auditd
step #2: $ auditctl -a always,exit -F arch=b64 -S openat,renameat2,unlinkat
step #3: $ echo t>delme;echo t2>>delme;cat delme;mv delme d;mv d 
delme;rm delme
step #4: $ service auditd stop
step #5: $ ausearch -f delme

There are syscalls from /usr/bin/cat, /usr/bin/mv, /usr/bin/rm but there 
are no any syscalls (openat expected)
for /usr/bin/bash (current shell process) for the file.

If step #3 is performed from another tty, then openat syscalls
(CREATE for the first echo and NORMAL for the second one)
is logged for the /usr/bin/bash process.

`uname -a` returns: Linux grin-vb-ubuntu-22-0-4 5.19.0-41-generic 
#42~22.04.01-Ubuntu SMP PREEMPT_DYNAMIC Tue Apr 18 17:40:00 UTC 2 x86_64 
x86_64 x86_64 GNU/Linux

Should I open an issue for the case at 
https://github.com/linux-audit/audit-kernel ?


Best regards
Rinat


PS.
At first I had the same problem with my service that listens to 
audit-netlink.
Then I just checked out the same scenario for auditid.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


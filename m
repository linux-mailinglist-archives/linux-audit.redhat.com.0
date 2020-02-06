Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6408F154837
	for <lists+linux-audit@lfdr.de>; Thu,  6 Feb 2020 16:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581003465;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wEfYDXHz96Jugw+MygNAASewWVbfjH1A1DbwIB1b3pE=;
	b=SGWyhWuep8ypWwlquIK/8kcuMdj839AvXTefhUwnBU8ofZKr1iJ7AnqlT5FB/NC0u4U3fH
	vYH/8AtdxaVZ/g2g8ND86eOavqaP4EajFrm8FexWF1FFyBOAsOhKQkZkUUXO4roAFk4MaG
	gH8lE1q46PpVl2kT/2U5dKeMwCYaucU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-BMReCNGtOW6PuuvUr82GeA-1; Thu, 06 Feb 2020 10:37:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7B038018A4;
	Thu,  6 Feb 2020 15:37:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD872790EE;
	Thu,  6 Feb 2020 15:37:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 493F0866A5;
	Thu,  6 Feb 2020 15:37:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016FbN6u030170 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 10:37:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EE9F6105552B; Thu,  6 Feb 2020 15:37:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9BD61055528
	for <linux-audit@redhat.com>; Thu,  6 Feb 2020 15:37:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A507803883
	for <linux-audit@redhat.com>; Thu,  6 Feb 2020 15:37:20 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-329-ekd1eIcEPi6ezekCW85YXg-1; Thu, 06 Feb 2020 10:37:18 -0500
Received: by mail-pf1-f173.google.com with SMTP id p14so3307695pfn.4
	for <linux-audit@redhat.com>; Thu, 06 Feb 2020 07:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=H9aqGt9YFIrijmqk5+O0VnVa65EJtZVWWEG7Pz5nZRk=;
	b=k2Rf8P/JHM6WmixyKIIiQBXX9HAQ38oUIA48jSijNCqtAUHYKfnjeGCcvsyU5EK35n
	JPth7i9PHHy86E0BWIKALiWkOlWrkzpH4jhfkXNAue2NEqYRJcO+8VHr/QsSVcoiGn1N
	yq+nzpQIqT43hJp/VHFQxDyoGnZ6qqtAZkktpuSATcjNARlTNOxsXcE205WS3ZrrfBxf
	oWjJB6zJtwMjRwPCmntivwY9m22/Iu8N25Qy7VDPVGKQp/MD/NfnjrQfU/lKEEv15XPZ
	g6kdV/nEzaJJL6XFCMcgRxxlR+y8DgXX/zljRcNiUHafCmpthKR+Vb80D1DtWpl+Ue9K
	C8Bg==
X-Gm-Message-State: APjAAAWLC4L2TOELz0+n6tvetOL6ooAQxD9+UJ3iprRsGc2jj0u97tzm
	CNVbeTIWrTgw7/P29BoojVeE5MM0b2A=
X-Google-Smtp-Source: APXvYqyaVQFen21PlOMDFlPcVPDpAqyMr9nyR1xPDls2F5FjK5oLhvq9jpxkpwUOqfuvaipB30x/aw==
X-Received: by 2002:a63:615:: with SMTP id 21mr4316054pgg.440.1581003436492;
	Thu, 06 Feb 2020 07:37:16 -0800 (PST)
Received: from [192.168.0.137] ([216.158.248.67])
	by smtp.gmail.com with ESMTPSA id
	n15sm3773130pfq.168.2020.02.06.07.37.15 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 06 Feb 2020 07:37:15 -0800 (PST)
Subject: Re: Is auditing ftruncate useful?
To: linux-audit@redhat.com
References: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <7f299e8c-6888-91eb-8feb-91e37fb87fd2@magitekltd.com>
Date: Thu, 6 Feb 2020 08:37:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5599a207-7054-af2e-6d10-0421154168b8@nwra.com>
Content-Language: en-US
X-MC-Unique: ekd1eIcEPi6ezekCW85YXg-1
X-MC-Unique: BMReCNGtOW6PuuvUr82GeA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 2/5/20 4:27 PM, Orion Poplawski wrote:

> I would like to track file modifications made by a specific UID.  I have:
>
> -a exit,never -F dir=/proc/
> -a exit,never -F dir=/var/cache/
> -a exit,never -F path=/etc/passwd -F exe=/usr/bin/kdeinit4
> -a exit,never -F exe=/usr/libexec/gam_server
> -a always,exit -F arch=b32 -S
> open,truncate,ftruncate,creat,openat,open_by_handle_at -F uid=XXXXX -k
> watched_users
> -a always,exit -F arch=b64 -S
> open,truncate,ftruncate,creat,openat,open_by_handle_at -F uid=XXXXX -k
> watched_users
>
> but as near as I can tell, this is all that gets logged for ftruncate:
>
>
> type=SYSCALL msg=audit(1580944297.114:831002): arch=c000003e syscall=77
> success=yes exit=0 a0=33 a1=28 a2=7f3417100018 a3=1 items=0 ppid=23746
> pid=23816 auid=XXXXX uid=XXXXX gid=XXXXX euid=XXXXX suid=XXXXX fsuid=XXXXX
> egid=XXXXX sgid=XXXXX fsgid=XXXXX tty=(none) ses=1 comm=57656220436F6E74656E74
> exe="/usr/lib64/firefox/firefox"
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key="watched_users"
> type=PROCTITLE msg=audit(1580944297.114:831002):
> proctitle=2F7573722F6C696236342F66697265666F782F66697265666F78002D636F6E74656E7470726F63002D6368696C6449440031002D6973466F7242726F77736572002D70726566734C656E0031002D707265664D617053697A6500313833303834002D706172656E744275696C644944003230323030313133313131393133002D
>
> which does not appear to contain enough information to determine what file was
> truncated.  Am I missing something?
>
> This is on EL7.
>
For starters, I'd interpret:

# ausearch -i -k watched_users

LCB

-- 
LC Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


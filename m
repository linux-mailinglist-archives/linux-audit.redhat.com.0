Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E82BBF5E37
	for <lists+linux-audit@lfdr.de>; Sat,  9 Nov 2019 10:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573291163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z26eVDi/gDBCu/ohwEZ/Swg7mgm7mbMwpTCd0+jGRXs=;
	b=Iw3l5rnIeGTqZhGSzMsber1i1ChWKcRt60MhaoR03okrlfrpgpcWM5JKX94yQZck7cCPC/
	CYmWI/i95kG/wfSY/IXbEQYoDUZnbu6pOWZ1Z3cWQudYzdt8mFsWf+AGCFRSqSQ30A2CE8
	pENbwQnqLNDQyBp9kLbTH1KY+tiUFZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-IL4RWBroPMee8TUtH1_d4A-1; Sat, 09 Nov 2019 04:19:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 209DF8017DD;
	Sat,  9 Nov 2019 09:19:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D6E95D6AE;
	Sat,  9 Nov 2019 09:19:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0A471808878;
	Sat,  9 Nov 2019 09:19:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA99IruJ014939 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 9 Nov 2019 04:18:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A91895D6B7; Sat,  9 Nov 2019 09:18:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B0EE5D6AE
	for <linux-audit@redhat.com>; Sat,  9 Nov 2019 09:18:51 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5807D800396
	for <linux-audit@redhat.com>; Sat,  9 Nov 2019 09:18:50 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 193so6731478pfc.13
	for <linux-audit@redhat.com>; Sat, 09 Nov 2019 01:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qkfceKCJKETCJ2/vhSXGZzlwHApvw78EZ+KhYtdGoh4=;
	b=Tp2TXJn2AXYzCQFibYnLQRHHmMMt3n8VzFveUnQqVnRJS6dj86AyZbew/GoSnCS/1b
	+WWajwhJJB6sU8MoLFvD+qpkZsttO3f11OTE3PCFJuj7XUgLUisIqrgdqPGkky5B9Q3p
	FSwtr6QnXRziJzlXnUzv4SpcfRWQBQ7LUf8vA9dSfH/NdV+KYaENJ7F22my/tt5V7IvY
	nhp+iqGl5SqtBxuJWx5x4s81wg3xBMRJZoGn1lmaj9mlIbwrIqU0w2159q1wgGOgOQrC
	84vDYLhPWsyEYiuiXB8FwNngvzhQmb1OQCXDLymdA5H9qn+rA6oY5f8NLgotGHHQjsI6
	KONA==
X-Gm-Message-State: APjAAAUpf7stLCDChjL17tbNNTLNVsNPvWCzzIQCj58yKqVc9IaRV/x7
	Fzzatsq09/Dc/kYW/g5aSf7OyzGdw/w=
X-Google-Smtp-Source: APXvYqwwafsINIqrJPtsAqR9hFhi5m8/rMmakl4H9u7f1N+Up1RpR0hB9whlPG8dPU1y1e7qYMjk/A==
X-Received: by 2002:a17:90a:c68f:: with SMTP id
	n15mr12622918pjt.20.1573291129251; 
	Sat, 09 Nov 2019 01:18:49 -0800 (PST)
Received: from [192.168.1.116] (14-203-140-101.static.tpgi.com.au.
	[14.203.140.101]) by smtp.gmail.com with ESMTPSA id
	d23sm8777790pfo.140.2019.11.09.01.18.47 for <linux-audit@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Nov 2019 01:18:48 -0800 (PST)
Subject: Re: Not seeing access denied audit messages in restricted
	subdirectories
To: linux-audit@redhat.com
References: <OF3C0EFCFA.EE160C73-ON002584AC.006EBA93-072584AC.0071860C@notes.na.collabserv.com>
	<20191108223905.773a79d3@ivy-bridge>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <4f152216-63dc-4785-d878-fc57f48217f0@magitekltd.com>
Date: Sat, 9 Nov 2019 20:18:45 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191108223905.773a79d3@ivy-bridge>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Sat, 09 Nov 2019 09:18:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Sat, 09 Nov 2019 09:18:50 +0000 (UTC) for IP:'209.85.210.193'
	DOMAIN:'mail-pf1-f193.google.com'
	HELO:'mail-pf1-f193.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: 0.004  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.210.193 mail-pf1-f193.google.com 209.85.210.193
	mail-pf1-f193.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-MC-Unique: IL4RWBroPMee8TUtH1_d4A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On 11/9/19 8:39 AM, Steve Grubb wrote:

> On Fri, 8 Nov 2019 13:39:58 -0700
> "John T Olson" <jtolson@us.ibm.com> wrote:
>
>> Greetings,
>>
>> I have the following 2 audit rules set up:
>>
>> -a always,exit -F arch=3Db64 -S all -F exit=3D-EACCES -F dir=3D/gpfs/fs1
>> -a always,exit -F arch=3Db64 -S all -F exit=3D-EPERM -F dir=3D/gpfs/fs1
>>
>> I have a directory structure like the following:
>>
>> (13:15:26) zippleback-vm1:~ # ls -la /gpfs/fs1/test/
>> total 257
>> drwx------.  3 root root   4096 Nov  7 12:46 .
>> drwxr-xr-x. 15 root root 262144 Nov  7 12:50 ..
>> drwx------.  2 root root   4096 Nov  7 12:46 test2
>>
>> Essentially, directory "/gpfs/fs1/test/" is owned by root and has
>> permissions 700.  The subdirectory underneath it (with
>> path /gpfs/fs1/test/test2) is also owned by root and has permissions
>> 700.
>>
>> When I have a non-root user attempt to list the contents of directory
>> "/gpfs/fs1/test/" I receive an audit message for the denied access.
>> However, when the non-root user attempts to list the contents of the
>> subdirectory (/gpfs/fs1/test/test2), there is no audit message
>> generated. Does anyone know why this is and how I get audit messages
>> in both cases?
> Yes, the reason is because the path did not resolve so audit never saw
> it. This has been this way for quite some time. In the past, it was
> said because the path never resolved, a PATH record with all attributes
> could not be generated. I have mentioned to kernel maintainers, that
> the path is available as a syscall argument. While a full PATH record
> cannot be generated with file attributes, an abbreviated one could be
> generated. So, far...no one has saw this as a big enough problem to
> fix. Personally, I think it should be fixed.
>
At first blush, I completely agree. However, I'm wondering if the first
attempt completely failed, how would the second one even have the
knowledge of the unattainable path?

In the real world if the first one failed (in this example
/gpfs/fs1/test), because although the parent directory would list the
test directory, it is not reachable. But the listing of that one=A0 would
not happen at all (/gpfs/fs1/test/test2), because the non-root user had
no access to the listing dir (/gpfs/fs1/test). The caller would have had
to gain knowledge of its existence through other means.

I wonder if even acknowledging its existence via a "denied access" event
would be slightly counter-productive? The abbreviated PATH would be
nice, and since it is there, sure, why not? Then, if all calls either to
non-existent or say access-denied paths looked the same, then that would
be fine I think. I would not be as happy if one could sniff out
inaccessible directories (as opposed to non-existent) from audited
events though.

LCB

--=20
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B835789788
	for <lists+linux-audit@lfdr.de>; Sat, 26 Aug 2023 16:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693061284;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pw+9Zn2oIF+VNDND1pvejjeD3Ubj7fO+fu8TPPEraAw=;
	b=KXcmVkD7edBo528Ftf0SQcD6eMrKBJhcn3U4338rfNvC+wCD76L7yKomBTtycbKh//Y2bN
	XSkp5wCeu6lhZPTn58wgmELFO0Hw9p8TPFS8N9uNOFpZ2u9+yo6huhxaOFGkVupfbZdMmn
	/L6lvyDJVZFHGQl2IGXnhOUKHk3/bc4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-685-ZwgG9WNmM4q4IXaMjtHtlg-1; Sat, 26 Aug 2023 10:48:00 -0400
X-MC-Unique: ZwgG9WNmM4q4IXaMjtHtlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA50F29A9D48;
	Sat, 26 Aug 2023 14:47:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93C4B112131B;
	Sat, 26 Aug 2023 14:47:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9EC1219465BA;
	Sat, 26 Aug 2023 14:47:52 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 953F319465A8 for <linux-audit@listman.corp.redhat.com>;
 Sat, 26 Aug 2023 14:47:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5ECDA112131B; Sat, 26 Aug 2023 14:47:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56B921121319
 for <linux-audit@redhat.com>; Sat, 26 Aug 2023 14:47:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA21858EED
 for <linux-audit@redhat.com>; Sat, 26 Aug 2023 14:47:50 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-7eYNQsP5MZ-LVE0CtnP-NQ-1; Sat, 26 Aug 2023 10:47:48 -0400
X-MC-Unique: 7eYNQsP5MZ-LVE0CtnP-NQ-1
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-64f4ac604c2so9528986d6.1
 for <linux-audit@redhat.com>; Sat, 26 Aug 2023 07:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693061268; x=1693666068;
 h=content-transfer-encoding:mime-version:subject:user-agent
 :references:in-reply-to:message-id:date:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nViQWLFd9G19TwFRhrWwk6czyiLSpZ+QmjfzziUuEJM=;
 b=DbSiVnFy2wTckLrtXiG+rzqLv/2wkGTSTvABXO9Ofwp6YtevlJw49C7E82xG25lMF4
 cg4HjUfSdPl766cbGbveskpFrljw1Fc3iGr1TGsrEnViNivSiCGLEzhlxKa6qUUWtC71
 gGnty6uGfgji5QY8NDlk+C+GbL97QPWHcqHVad/oMsjzj4qBZOmmf59zgD3BELOfWEXh
 MQs/8GFjiG0OQEYiOynmMcSeFvlYKdeEyQXu6iv465J5z4QV8AkVZuL6vtS+XhQUcML8
 48FoNWT6e0PdhbzG+pvZoggxXIbO4paKCKLp9zkI46Zxl6LBTAtQuS5H76/ZLsShFZR1
 QbNg==
X-Gm-Message-State: AOJu0Yy3t4xDx9vk1Izm9Rj2IvdCJ+LPIolelu/TpzHR/rR3RR7teI3u
 wjZwj18PJCv3Io7G6bmBCn02
X-Google-Smtp-Source: AGHT+IFILZuWdsRqZ8xcfYMqguqfPfxA3pbiq8v+sCn7BGUVwUxFuGx8LTC0kimYIhVaOTkyNrPg2g==
X-Received: by 2002:a0c:f8d1:0:b0:647:1993:92da with SMTP id
 h17-20020a0cf8d1000000b00647199392damr20279071qvo.48.1693061267840; 
 Sat, 26 Aug 2023 07:47:47 -0700 (PDT)
Received: from [192.168.7.16] ([70.22.175.108])
 by smtp.gmail.com with ESMTPSA id
 pj47-20020a05620a1daf00b0076cddd12aa4sm1192611qkn.77.2023.08.26.07.47.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 26 Aug 2023 07:47:47 -0700 (PDT)
From: Paul Moore <paul@paul-moore.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Date: Sat, 26 Aug 2023 10:47:45 -0400
Message-ID: <18a3250b668.28a4.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <6e4603ea-3ce8-5b9e-0ddf-9ec893ddd32e@I-love.SAKURA.ne.jp>
References: <36b65eb1-ccbf-8b81-468f-b8d88c4be5a3@I-love.SAKURA.ne.jp>
 <CAHC9VhSz=3utr_CigGvkMEb6_avJUQq1Ak2smB7neSd76mzjFw@mail.gmail.com>
 <6957af54-16a2-4c28-56ff-dafe95f4e276@I-love.SAKURA.ne.jp>
 <CAHC9VhTj-PQ0qPTiphPLXyJx3bWeqgVS_GPCWNgjqFqBgH6Njg@mail.gmail.com>
 <b0b60fdc-4484-2265-7fdf-8367bf218d18@I-love.SAKURA.ne.jp>
 <CAHC9VhRaUxN=oEyKCOrfrGzJeXDGxv2EKbZH3qwAB6AhKcSfog@mail.gmail.com>
 <68a0ef90-b452-2096-3729-b5c208878ff9@I-love.SAKURA.ne.jp>
 <CAHC9VhTPgnzdn1tmEmufcbseN_Q1CyzxTEzfvZW7OCBTeAadmA@mail.gmail.com>
 <d2557f88-0cda-b0bf-5c76-7c18912798c9@I-love.SAKURA.ne.jp>
 <CAHC9VhTZE2BinivPRLJ9S_21YcmXA6tMdDtAm5w3nk0dbZ0j1w@mail.gmail.com>
 <e9c593d9-6369-2987-ce20-5832dbebd027@I-love.SAKURA.ne.jp>
 <e56ed3a6-9d82-a181-bbc7-e322ea47cb98@I-love.SAKURA.ne.jp>
 <CAHC9VhRTVsoMWhP1+j7RcUqy2EiV=Z7W_00h55PE-WezzLg=Ew@mail.gmail.com>
 <693f623f-76dd-a709-4916-6d78fe29c9b4@I-love.SAKURA.ne.jp>
 <18a2ac400f8.28a4.85c95baa4474aabc7814e68940a78392@paul-moore.com>
 <6e4603ea-3ce8-5b9e-0ddf-9ec893ddd32e@I-love.SAKURA.ne.jp>
User-Agent: AquaMail/1.46.0 (build: 104600328)
Subject: Re: [PATCH] audit: add task history record
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: audit@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 linux-audit@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: paul-moore.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On August 26, 2023 2:38:55 AM Tetsuo Handa 
<penguin-kernel@I-love.SAKURA.ne.jp> wrote:
> On 2023/08/25 12:36, Paul Moore wrote:
>>> It is unfortunate that you continue ignoring the
>>>
>>> How can auditd generate logs that are not triggered via syscalls?
>>>
>>> line. I know how to configure syscall rules using "-S" option. But I do
>>> not know how to configure non syscall rules (such as process creation via
>>> kthread_create(), process termination due to tty hangup or OOM killer).
>>
>> At this point you've exhausted my goodwill so I would suggest simply reading
>> the audit code, manages, and experimenting with a running system to understand
>> how things work, especially for non-syscall records.
>
> Are we on the same page that non-syscall records include process creation via
> kthread_create() and process termination via send_sig() ?

I'm not confident that we are in agreement on many of the issues in this 
thread, some of that is likely due to disagreements in what functionality 
is worthwhile, but I believe some of that is due to misunderstandings.  I'm 
not going to merge the patch you posted at the start of this thread, but as 
I've mentioned *several* times now, if you find a kernel code path that is 
missing an audit logging call submit a patch with an explanation of why the 
audit call is needed and we can discuss it.

My initial thinking is that we do not need, or want, an audit call in 
kthread_create(). I'm less sure about send_sig(), and as my network access 
is limited at the moment I don't have the ability to look into it further 
right now. If you feel we do need an additional audit call, create a patch, 
test it, write a good commit description explaining why it is necessary and 
we can review it.

--
paul-moore.com
>




--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


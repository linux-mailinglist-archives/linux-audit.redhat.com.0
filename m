Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558B67F98B
	for <lists+linux-audit@lfdr.de>; Sat, 28 Jan 2023 17:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674923046;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZJqI1DAuGAvXXJE6cxi1FFxrOraQuOXoWkz+TRELf5c=;
	b=PBvdv4ALNuhWbFW29pCxn6Ep+V+ZaJ8Ed+v6zgaK8yTcZgvkVkvOAFwEjYk5st1WlgEkqV
	Nbh3RjV+NMCDrTnSSYQ4phdGWz3fbLr2dch29bThuUgLjnI+mO8Qe5MI3EfJAyRRXlkbO2
	pm2Ljx7GtHrZaLYymbdtTlivR2fLlLw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-rR4Bbl25M5CnXEEfIWpiqg-1; Sat, 28 Jan 2023 11:23:45 -0500
X-MC-Unique: rR4Bbl25M5CnXEEfIWpiqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1120E85C064;
	Sat, 28 Jan 2023 16:23:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88C3B2166B26;
	Sat, 28 Jan 2023 16:23:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B774519465B6;
	Sat, 28 Jan 2023 16:23:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C713D194658C for <linux-audit@listman.corp.redhat.com>;
 Fri, 27 Jan 2023 22:45:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B7D5140C200C; Fri, 27 Jan 2023 22:45:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B04D140C2064
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:45:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 939D785A588
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 22:45:19 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-YKmk8SfOOlKdLQhFXLETBw-1; Fri, 27 Jan 2023 17:45:17 -0500
X-MC-Unique: YKmk8SfOOlKdLQhFXLETBw-1
Received: by mail-pj1-f42.google.com with SMTP id b10so5976302pjo.1
 for <linux-audit@redhat.com>; Fri, 27 Jan 2023 14:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5wXhf32dQp7HTWwdehDrHWyNx8yhhU2eOdzrxP6+BGI=;
 b=7xybGr0N8regoG2l1B1r+iPHkobz1QgGCsStqOqbeojKa8dF5pG3//g+xZDlejfkwY
 MVY1DcsQRBR0fn6G4HkvVOzUDQ3EbfgjbPv/SwfhPkdVHonx1esd0VrNVgqZEiWW49jX
 2pSjKFvfnYoueqwhusLIBKezZN63ZTmGjkpR6WMDc1IjBQUWwuIMO5aeKe6u375JzRHm
 BDCHchcc6OkRRG+YCf2gYSaFp63VNLRcJGpXquGSgRs6UzBDyW36eIjQZFTQYMPhLA3f
 l1GZf8+wopp/4eQi7Uioh7tzH/bxin0EArqPMdThLC87PxBzUj4l6bgx/nASv6NR6oUD
 yoYQ==
X-Gm-Message-State: AO0yUKVVmGQnJifW7Iho4PXjtbTvVpxjq0yIu7r8zvN177OI70TsF8RW
 bp4iH95g6BNaCHFGh7/1/t+ghg==
X-Google-Smtp-Source: AK7set/urEU+vaRFtR4rBlynkEVi5f4STjzUbdQyrZbnvT7Ewn/tNuPq9vLB2Vx7dTjOwerq1lgG1A==
X-Received: by 2002:a17:902:d4d1:b0:196:1f80:105a with SMTP id
 o17-20020a170902d4d100b001961f80105amr3123040plg.5.1674859516359; 
 Fri, 27 Jan 2023 14:45:16 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a170902ecc900b001949ae8c275sm3347677plh.141.2023.01.27.14.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:45:15 -0800 (PST)
Message-ID: <6d3f76ae-9f86-a96e-d540-cfd45475e288@kernel.dk>
Date: Fri, 27 Jan 2023 15:45:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/2] io_uring,audit: audit IORING_OP_FADVISE but not
 IORING_OP_MADVISE
To: Paul Moore <paul@paul-moore.com>, Richard Guy Briggs <rgb@redhat.com>
References: <cover.1674682056.git.rgb@redhat.com>
 <68eb0c2dd50bca1af91203669f7f1f8312331f38.1674682056.git.rgb@redhat.com>
 <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAHC9VhSZNGs+SQU7WCD+ObMcwv-=1ZkBts8oHn40qWsQ=n0pXA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Sat, 28 Jan 2023 16:23:32 +0000
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
Cc: Christian Brauner <brauner@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/27/23 3:35?PM, Paul Moore wrote:
> On Fri, Jan 27, 2023 at 12:24 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>>
>> Since FADVISE can truncate files and MADVISE operates on memory, reverse
>> the audit_skip tags.
>>
>> Fixes: 5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
>> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
>> ---
>>  io_uring/opdef.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/io_uring/opdef.c b/io_uring/opdef.c
>> index 3aa0d65c50e3..a2bf53b4a38a 100644
>> --- a/io_uring/opdef.c
>> +++ b/io_uring/opdef.c
>> @@ -306,12 +306,12 @@ const struct io_op_def io_op_defs[] = {
>>         },
>>         [IORING_OP_FADVISE] = {
>>                 .needs_file             = 1,
>> -               .audit_skip             = 1,
>>                 .name                   = "FADVISE",
>>                 .prep                   = io_fadvise_prep,
>>                 .issue                  = io_fadvise,
>>         },
> 
> I've never used posix_fadvise() or the associated fadvise64*()
> syscalls, but from quickly reading the manpages and the
> generic_fadvise() function in the kernel I'm missing where the fadvise
> family of functions could be used to truncate a file, can you show me
> where this happens?  The closest I can see is the manipulation of the
> page cache, but that shouldn't actually modify the file ... right?

Yeah, honestly not sure where that came from. Maybe it's being mixed up
with fallocate? All fadvise (or madvise, for that matter) does is
provide hints on the caching or access pattern. On second thought, both
of these should be able to set audit_skip as far as I can tell.

-- 
Jens Axboe

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7510C662DFE
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 19:04:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673287462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=70SW80aIeDvUYhXlFAZtOyvJhi5TO5aGU8hrDLHHZSw=;
	b=TthOuJ/S2LZySNtoTQaMCB689oOrnDn+gDR7wenKGeiyKebndcmErDz9UcnFx/BnqA3Ub4
	oWftimtMREOYfldb3jrIHodctJBxDjOb3zJaFY2axPvSExq2Iyj8r7cSSp4xk1ucma1t47
	kUST92jIhRdsIQXpoRmrSos6KC0I/W8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-e1t_v0bNPUa5XES--Hi2bA-1; Mon, 09 Jan 2023 13:04:19 -0500
X-MC-Unique: e1t_v0bNPUa5XES--Hi2bA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B72C5100F931;
	Mon,  9 Jan 2023 18:04:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EEF340C201E;
	Mon,  9 Jan 2023 18:04:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8B6F8194975B;
	Mon,  9 Jan 2023 18:04:04 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6EA911946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 17:58:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 514D42166B26; Mon,  9 Jan 2023 17:58:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 498382166B29
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 17:58:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A996811E6E
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 17:58:33 +0000 (UTC)
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-od7cgof5PwiohkV1wEZpVg-1; Mon, 09 Jan 2023 12:58:31 -0500
X-MC-Unique: od7cgof5PwiohkV1wEZpVg-1
Received: by mail-pf1-f201.google.com with SMTP id
 x28-20020a056a000bdc00b005826732edb6so3812673pfu.22
 for <linux-audit@redhat.com>; Mon, 09 Jan 2023 09:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7wHAzTYynvmx1uoMaFbPm/qLc1nLrur1XarUzaqZ8OI=;
 b=0rhG0E9CLanEj9MSPLQwbT/eRGzEL2djx/3n/XwVrRQSBRFg9N8aQd3pVWLCe04clA
 F+BeVtdE4ahn9j9UQFuahlLgDsNVUTwveMWXd8eIQcmIR7n/uhy51oO56FC3n9Kq82FE
 RaFkQC5H0gjMTXt5sJ82+nRxfKHi9gqSBGBm2i5ok0KzqaWUFsHZf7RGek1tMT8UzByU
 UPFplwrvpvTJCtTFsQvBVzTqJnois+sO3Uz/HVvrBJgtt2WOWg+0vYABPOLKzSe1Nd/Q
 CeSDHO3LoAM1/q84kyzR3G99AHsp4rDmFPHAmTDh+J6J+9Q6B/LSP1VVg8ll2/PyAUsc
 asew==
X-Gm-Message-State: AFqh2kqOcNcxyynlMQgEdMH3vCBeWCGjVaOoGKNA4ZMt+oS9b9ysyrx6
 ZnoIV5SFKUUOLWVkn//wIhZy1gg=
X-Google-Smtp-Source: AMrXdXvZi9JfVG8MSXeVESoWTLTnIykaIiW7J1vs+3N4ldT4afJwDmAkX/FakGaMsK1BJtH4o3js65E=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a62:84c1:0:b0:583:63ea:f5e8 with SMTP id
 k184-20020a6284c1000000b0058363eaf5e8mr1068377pfd.60.1673287110577; Mon, 09
 Jan 2023 09:58:30 -0800 (PST)
Date: Mon, 9 Jan 2023 09:58:29 -0800
In-Reply-To: <CAHC9VhRLSAbSHE1nTGwjuUdMtfwTsRVjhV+eznWRw5Ju_qgDAA@mail.gmail.com>
Mime-Version: 1.0
References: <20230106154400.74211-1-paul@paul-moore.com>
 <20230106154400.74211-2-paul@paul-moore.com>
 <CAKH8qBtr3A+EH2J6DCaVbgoGMetKbLUOQ8ZF=cJSFd8ym-0vxw@mail.gmail.com>
 <CAHC9VhRLSAbSHE1nTGwjuUdMtfwTsRVjhV+eznWRw5Ju_qgDAA@mail.gmail.com>
Message-ID: <Y7xVxT7gWIhRitza@google.com>
Subject: Re: [PATCH v3 2/2] bpf: remove the do_idr_lock parameter from
 bpf_prog_free_id()
From: sdf@google.com
To: Paul Moore <paul@paul-moore.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Mon, 09 Jan 2023 18:04:03 +0000
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
Cc: bpf@vger.kernel.org, linux-audit@redhat.com,
 Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"

On 01/09, Paul Moore wrote:
> On Fri, Jan 6, 2023 at 2:45 PM Stanislav Fomichev <sdf@google.com> wrote:
> >
> > On Fri, Jan 6, 2023 at 7:44 AM Paul Moore <paul@paul-moore.com> wrote:
> > >
> > > It was determined that the do_idr_lock parameter to
> > > bpf_prog_free_id() was not necessary as it should always be true.
> > >
> > > Suggested-by: Stanislav Fomichev <sdf@google.com>
> >
> > nit: I believe it's been suggested several times by different people

> As much as I would like to follow all of the kernel relevant mailing
> lists, I'm short about 30hrs in a day to do that, and you were the
> first one I saw suggesting that change :)

Sure, sure, I'm just stating it for the other people on the CC. So maybe
we can drop this line when applying.

> > Acked-by: Stanislav Fomichev <sdf@google.com>

> --
> paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


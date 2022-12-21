Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A504C6532BD
	for <lists+linux-audit@lfdr.de>; Wed, 21 Dec 2022 15:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671634478;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=st66ZJ6Eq1IZsSJeK8YD/YorsKrWjmirOeuOgnZ9B98=;
	b=g611PvRkTGKT3G/T4/4405CxkSVUYZBxvElXlR/X+6+3Bk7DpaXZROc/s+8ZQQgWf+ADMP
	Y4comJI+QI1V+QFAx+WrBkoLgdIK01861tWbvY/Yt9GkBPB+q8gX2papP+5Fxo/zlqycQ3
	WYk1RWD68B90FhxHzww28I29pHCVI8M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-PfNo49E8MliZe8zQSDTYxw-1; Wed, 21 Dec 2022 09:54:34 -0500
X-MC-Unique: PfNo49E8MliZe8zQSDTYxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 720041C05AC1;
	Wed, 21 Dec 2022 14:54:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D702340C1073;
	Wed, 21 Dec 2022 14:54:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5A36319465B6;
	Wed, 21 Dec 2022 14:54:31 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 597DC19465A4 for <linux-audit@listman.corp.redhat.com>;
 Wed, 21 Dec 2022 14:54:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 03C7D14152F6; Wed, 21 Dec 2022 14:54:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F00C314152F4
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 14:54:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D43E287B2A4
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 14:54:29 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-wZTYebkBNKOY9H1ETfWiVQ-1; Wed, 21 Dec 2022 09:54:28 -0500
X-MC-Unique: wZTYebkBNKOY9H1ETfWiVQ-1
Received: by mail-pg1-f172.google.com with SMTP id 36so10539798pgp.10
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 06:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1uJdiLx5zTNfnxpPiPscbao50tqFgH4C7CvbPz01G74=;
 b=ZXZJQJJ0z4usp4cLhaRhgG2/gGr9AJU1S7NSrEheZmGU65W/VTV8CQT3f6vSrWLNLi
 1LrevzhklM9KAyOslq8T/qTadZSlCOjzepIAO0iTTp5tagVJMDThDxellbPFeWyQBVmY
 y1+wNuHk8iYpdmTUg7KeB0OTWZy4b8FOPqLz5W2jynYkp9NC7XvszJPvbnqBkX2FqWMt
 1IRbdaX/eazU6zkuKzV7pZ8E3m8q8Iu+hgh95ATtFElxSIX0t1QMptxFujFXleDwJHSa
 0fQ8kxNmSYTJpUPZk3rtFhgYlIBDkTFlWiy1gOR75K47/pwiO/6nO3mo6ZrwEPnGwLnt
 tkUw==
X-Gm-Message-State: AFqh2krv1DHOCZzh7XTE90pagi0fpfVm+PyT2kr8mOPEyyVCxzS561BY
 rq8b3Jeimtw/ThBX+6bV1Z3wqaPrvGI2wFhOWckD
X-Google-Smtp-Source: AMrXdXvQTUun/05kvpQeBUYKEF1Q6CNjf+tZxkklIbkHHswz36cSkME9ZCjhM+qY4N7y3qphihi/TSwGEc0lwdqsWPE=
X-Received: by 2002:a63:4e5d:0:b0:478:42f:5a3d with SMTP id
 o29-20020a634e5d000000b00478042f5a3dmr106815pgl.3.1671634466925; Wed, 21 Dec
 2022 06:54:26 -0800 (PST)
MIME-Version: 1.0
References: <df1eacecc605f856fa80d66d81eddea4dc70ce56.camel@iinet.net.au>
 <5652312.DvuYhMxLoT@x2>
 <602700a68fa5b8d68baef4368eaa5e8adf3799a3.camel@iinet.net.au>
 <CAHC9VhSNq5xzpB2jzxK5oFQAM2uGefihCYH0iq91=0Lm=D8jig@mail.gmail.com>
In-Reply-To: <CAHC9VhSNq5xzpB2jzxK5oFQAM2uGefihCYH0iq91=0Lm=D8jig@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 Dec 2022 09:54:15 -0500
Message-ID: <CAHC9VhTTnhT5pwpa4jjbE+2fTc1aO5oAiVoP9ERm-khC+EkLMQ@mail.gmail.com>
Subject: Re: BPF audit logs
To: burn@swtf.dyndns.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 21, 2022 at 9:44 AM Paul Moore <paul@paul-moore.com> wrote:
> On Tue, Dec 20, 2022 at 7:02 PM Burn Alting <burn.alting@iinet.net.au> wrote:
> > And to cap this off, the program id will always be zero on an UNLOAD, as
> > the routine that sets it to zero, kernel/bpf/syscall.c:bpf_prog_free_id(),
> > is called before the emit audit event routine, kernel/bpf/syscall.c:bpf_audit_prog().
> >
> > So a bug!
>
> Ooof :/  Independent of the other issues this is something we should
> fix as soon as we can.  I'll take a look during the holiday and see
> what we can do to fix this; looking quickly at it now I don't think it
> will be too bad, but one never knows for sure ...

I'm still just looking at the code, but I think we can also do a
better job associating eBPF UNLOAD operations.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CFF3829CCDE
	for <lists+linux-audit@lfdr.de>; Wed, 28 Oct 2020 02:24:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-6osqO5OJNVeA3toPw2xzWg-1; Tue, 27 Oct 2020 21:24:34 -0400
X-MC-Unique: 6osqO5OJNVeA3toPw2xzWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 433A3805EE3;
	Wed, 28 Oct 2020 01:24:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29BD25C1C5;
	Wed, 28 Oct 2020 01:24:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 314D0181A869;
	Wed, 28 Oct 2020 01:24:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09S102JR025047 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 27 Oct 2020 21:00:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E53532157F24; Wed, 28 Oct 2020 01:00:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC7812157F23
	for <linux-audit@redhat.com>; Wed, 28 Oct 2020 00:59:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9DA8858298
	for <linux-audit@redhat.com>; Wed, 28 Oct 2020 00:59:59 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-451-ImCRQ3V0Mvm8mAyAapKBeg-1; Tue, 27 Oct 2020 20:59:57 -0400
X-MC-Unique: ImCRQ3V0Mvm8mAyAapKBeg-1
Received: by mail-ej1-f65.google.com with SMTP id p9so4862681eji.4
	for <linux-audit@redhat.com>; Tue, 27 Oct 2020 17:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uP/JEghnSGmj7e6AesSlvrZCV6WUBdPW7UyUOd9YPjI=;
	b=UnIRQNftjapLyumwX84NX0Uk48j7kvVTyVkJoH5B9agFmMyiGXpNY2sFbIUW+ytc2e
	yxQ72laJvAG24+2cv4BQom9jQCOvhFu45zXHqePFgK40F8ZjOJMv3NjcC0Z+QTiL/nSk
	dUp4XejpE0lQaoWISBhBEhRvQ/HmagJsanMBcHu0cqOu9cVrId5w7j7D85q7pZPXm2kT
	CZHcFlft4m2QJu1nk/WgFzKftEL3cnamKEQO6R17mhN2MsKxfRHDZKMKz+LFViqFPCNt
	wE5UYErQtkWscnNoxo5E+ju/XTulrWWRdX23C7aA249Wu8ZnWF5YO/GaDq81euJvVVxY
	LjzQ==
X-Gm-Message-State: AOAM533ujnEivEsvT2m0DzrmHUsiVHDE1Qe6WujTXKA4wyEqNZvFjc+K
	SfgJ3Jd4/4/EZMHbCvFrc3b5bBYPRGODLna0S4J/
X-Google-Smtp-Source: ABdhPJxy3tTKM5QLQXt5ygim35ZXlLtmSNyEsb2Vs87VSTGD8dpJf1fiQCjE/MH+lUa0LAsHp33dW1sarczD6VGn2D8=
X-Received: by 2002:a17:906:25cc:: with SMTP id
	n12mr4949548ejb.488.1603846795601; 
	Tue, 27 Oct 2020 17:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
	<8c04d5c5d0144019c2c38d7c3f31061d6b35d360.1603469755.git.mchehab+huawei@kernel.org>
	<CAHC9VhQ88cuU-0QdpYJyJZE3FU-3graP=N9n9eiG4Kj2tDbiBQ@mail.gmail.com>
	<20201025233820.7f946e1c@coco.lan>
In-Reply-To: <20201025233820.7f946e1c@coco.lan>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 27 Oct 2020 20:59:44 -0400
Message-ID: <CAHC9VhTZtTXO8Woo_cCdBbg9Nq5A-vBdoOJo7gNUk+RRNBbeaw@mail.gmail.com>
Subject: Re: [PATCH v3 51/56] audit: fix a kernel-doc markup
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 25, 2020 at 6:38 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Sun, 25 Oct 2020 18:10:44 -0400
> Paul Moore <paul@paul-moore.com> escreveu:
>
> > On Fri, Oct 23, 2020 at 12:33 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > typo:
> > >         kauditd_print_skb -> kauditd_printk_skb
> > >
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  kernel/audit.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Looks good to me, nice catch.  Would you like me to pull this into the
> > audit tree or are you intending this to get pulled in as part of the
> > larger patchset somewhere else?
>
> Feel free to apply it directly via audit tree.

I just merged it into audit/next, you should see it shortly.  Thanks!

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


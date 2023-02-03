Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A4F689F7B
	for <lists+linux-audit@lfdr.de>; Fri,  3 Feb 2023 17:40:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675442434;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D1j3A10asTdYEkDdph/a6FRojTEBt4i6Fs/KTwdiJVg=;
	b=DfIlPPodSEpAEAHqMq/wm6xCC6OJ4yjZ+yZNwGgA+brA4vlubjh3LKKW583eFmZu/kn4Au
	8ViKmwypmzw/qFJqKwzcXjDr/o+P4wc1BaMpQdSKRHkB+70PCeoJbm1dw3GSd1qrbcGcDs
	jmyXB2m784iraDrnB2cZHG+/u2FMjhU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-GGm1A1LmNVCdhQj3Hz3i5A-1; Fri, 03 Feb 2023 11:40:32 -0500
X-MC-Unique: GGm1A1LmNVCdhQj3Hz3i5A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A063F101A55E;
	Fri,  3 Feb 2023 16:40:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7C42492C18;
	Fri,  3 Feb 2023 16:40:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7EBEF19465B2;
	Fri,  3 Feb 2023 16:40:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DAFC519465A3 for <linux-audit@listman.corp.redhat.com>;
 Fri,  3 Feb 2023 16:40:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A291C40B42D4; Fri,  3 Feb 2023 16:40:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AD23400EAB9
 for <linux-audit@redhat.com>; Fri,  3 Feb 2023 16:40:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 777B9802C16
 for <linux-audit@redhat.com>; Fri,  3 Feb 2023 16:40:14 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-157-O1GSYjjjOXS2GflgB0Iyhw-1; Fri, 03 Feb 2023 11:40:11 -0500
X-MC-Unique: O1GSYjjjOXS2GflgB0Iyhw-1
Received: by mail-pg1-f170.google.com with SMTP id 5so64536pgd.3
 for <linux-audit@redhat.com>; Fri, 03 Feb 2023 08:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OPHz4Zw+/rSDVINrssT7FHIDMQxNAyfWLPfWiDGUczg=;
 b=bnOr9ITnTfKnD+Hvcr+40VnLLaU08WADLedejDtGrlna2IXjNVbHREA/W7BlyU9R1m
 hOHPlP6YQQrSXUiZCOdetFJ0mhzc3Q++DIFKngEPjQRvNvWe582ylRPnRyGY75Gn36/c
 kKhl/0ZG9IZUylnMIx64/MajiiRcf2MrRNSswhMHcuZ/zeGLq3W+vnTV9hZ8eerS3Zzz
 XHXhxVbJ+9LWQ1DX681NE7urugtXLPYYBwFg7pfBEgWU9bood3o6E0y8MA4U/UO6cP+L
 hCjtReNc2tAXrZCjMO3j3w3+S0RL47TYRxKekgIRWKWEZscmz/fVt0b5By1zIgKVTMyV
 7u7g==
X-Gm-Message-State: AO0yUKU1f7oiq/hfsJauQWNntmzfH4o3JRaXpqEpX/2qnLROszwbwLti
 sT/oOoMW1jbqkkMhbSoYI4w+fbAGnplQ09X0V+9XhVugHgez
X-Google-Smtp-Source: AK7set9Z2McTIhnpIkdwke3DJ+TVx9dVxezlk3tbglbOaeP+KLpEXesxDDN+vDKVgZ/mki3QfpyPhOxBA2auWLdPmq8=
X-Received: by 2002:a05:6a00:240c:b0:596:c93:ecea with SMTP id
 z12-20020a056a00240c00b005960c93eceamr214675pfh.6.1675442410087; Fri, 03 Feb
 2023 08:40:10 -0800 (PST)
MIME-Version: 1.0
References: <CAHC9VhRM16vx4S+2FUcRftvt+DcPe_zASkAyAS4BSzBMFH=pog@mail.gmail.com>
In-Reply-To: <CAHC9VhRM16vx4S+2FUcRftvt+DcPe_zASkAyAS4BSzBMFH=pog@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 3 Feb 2023 11:39:59 -0500
Message-ID: <CAHC9VhTbnCkOqpsA7f_E0PROu02Q3fi+Z-06T8GuYQg166Wo=w@mail.gmail.com>
Subject: Re: Upstream kernel development and the linux-audit mailing list
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 2:44 PM Paul Moore <paul@paul-moore.com> wrote:
>
> Hello all,

...

> I'll hold off on list creation for a couple of days in case anyone has
> a well reasoned argument against moving upstream kernel development to
> a new list.  However, I want to underscore that any argument to keep
> upstream discussions on a moderated list will need to be strong enough
> to counter potentially excluding other subsystems from the discussion.

Seeing no comments, I just sent a request off to the vger
postmaster(s) to create a new list; I'll send another update when it
is up and running.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


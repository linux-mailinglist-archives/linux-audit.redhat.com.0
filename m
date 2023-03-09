Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD566B1B46
	for <lists+linux-audit@lfdr.de>; Thu,  9 Mar 2023 07:17:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678342650;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WACv9qMJTZN+9A7QHmLizNDUwOYk+FeJQJ5gIMSoDdw=;
	b=G6hJEY4n6ibPpWc3RyD05c9X7xQ4tkMaomzH5TbkWT0Wr5vhC2bpBr0hM4BvfXbA9igz7a
	jXB/pgl7YOeiWryaAX+MFizolnNBpO5vBVFwy0buBC6sURym2K0ZxXHpWkQqNJFxQVOQ1h
	wFKufSTO+Ad4K4irbEpTOY8qO/Ki8yI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-IFNRyILrNrid_T2FVGtbTg-1; Thu, 09 Mar 2023 01:17:27 -0500
X-MC-Unique: IFNRyILrNrid_T2FVGtbTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAA5C29AA38B;
	Thu,  9 Mar 2023 06:17:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EEFB14171C4;
	Thu,  9 Mar 2023 06:16:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1C69D1946A51;
	Thu,  9 Mar 2023 06:16:44 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 75D0B19465B5 for <linux-audit@listman.corp.redhat.com>;
 Thu,  9 Mar 2023 06:16:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05C512166B2A; Thu,  9 Mar 2023 06:16:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F29F12166B26
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 06:16:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C17A3800B23
 for <linux-audit@redhat.com>; Thu,  9 Mar 2023 06:16:41 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-534epiDfN4awk-v0bumdkw-1; Thu, 09 Mar 2023 01:16:39 -0500
X-MC-Unique: 534epiDfN4awk-v0bumdkw-1
Received: by mail-ua1-f47.google.com with SMTP id l24so422475uac.12;
 Wed, 08 Mar 2023 22:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678342599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ortQN1KB8PKKOVF7PFhVDUHXZfKr/ARClEMuutbCrI=;
 b=DXLa38L5POyA+lajyMtGcadtyo3+ct+DSM0rC3FB1tBlBntuqtCQDYydwdrfsqODDi
 +D7ply37CrCQOFrt02Jv3aj/Q0UagnTiDAJxmEVJ13WIvx9wDJcby3Q/94HR2kLsgpXq
 pN/6StCDDsChNCXYqT/Y0h9dEde4QMzsnlTYqKBYvfjJr28QfUjQqq5sJugp4yU17gYj
 LYnEFyJ/YBeuyi6qwlVKCF5KBOrUNo0zfrJuDH7pQC+kWllDoFSsK2SzAh/JkJCtK0bg
 BoofZ8VNbjhrCYUNEoXeHAHkj4DnlR2fAMiWpqb2A3jcOTNF1zoMUr/wbSNfL6BbKxC9
 FKFQ==
X-Gm-Message-State: AO0yUKUeoz97FIufHL/gu7ZklkAKIAnx1maW7njqVPVhqIMXr7vuUjla
 kN5PYeZlylJfaJGGP0y0U7QYwAKIhbBQqWWArn4=
X-Google-Smtp-Source: AK7set9X7Blr/P0ays8rHjH+gp6KCxuoW0zEkHLqjugPgXB9nSL0o+Xahngd1vLY0oulBNXY46CuWbn2VeG/G2/jphc=
X-Received: by 2002:a1f:6043:0:b0:42d:424c:aea3 with SMTP id
 u64-20020a1f6043000000b0042d424caea3mr3039280vkb.2.1678342599030; Wed, 08 Mar
 2023 22:16:39 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtvt_RZfPYLAWdPp6gTu_67f1RzOz3s4T62SdoG4ryyzGw@mail.gmail.com>
 <CAHC9VhRGFL8MDtNXbSoes-gV=qM3YmCU20=UQoCfR29nnU7dcA@mail.gmail.com>
In-Reply-To: <CAHC9VhRGFL8MDtNXbSoes-gV=qM3YmCU20=UQoCfR29nnU7dcA@mail.gmail.com>
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Thu, 9 Mar 2023 11:46:27 +0530
Message-ID: <CAPoNrtsZv96hz-E=nU8y2KSxhqU8vEfcVKQH6X=EqD3O0BmLwA@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Paul Moore <paul@paul-moore.com>, sgrubb@redhat.com
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
Cc: tibdewal.rahulkumar@gmail.com, Linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>
> However, I am fairly skeptical that we could add per-key rate limiting
> without introducing a non-trivial amount of overhead to record
> generation, which would be a show stopper for this feature given its
> expected limited appeal.
>

I understand the reservation. I will spend some time to analyze it impact

Steve, about your comment:

> There just really isn't room to add more thinkgs without some userspace API
> problem. (This would definitely need a feaure bitmap so user space can make
> sense of it.)

I was not aware that this could cause problems in the userspace API.

Key based filtering for rate limiting could be a useful feature. It is
something that would
help us a lot.

-- 
Anurag Aggarwal

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


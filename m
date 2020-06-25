Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 97E4D20A580
	for <lists+linux-audit@lfdr.de>; Thu, 25 Jun 2020 21:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593112515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zrwuuTuqbWzqxcUI+8IioElwkVsRvxH8w9ziG1XuwTM=;
	b=F7rm8NvQKpNvs8Q4y7saofJDgY6PwrQD0WJqRxr+F3eGGMLyNEIMqsvEpvveIeX6E8zXcA
	rMQ585P9OCgYvDXxJ3WkWvVyaxkJXPsGQQ36ALxrr/SqGvIsFUymjaiNR0kBEVIy89zuh7
	lsuingrP7OT0WXuxlJ88q4TIyIvtHyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-MyBnWwG-No6f5BDwu75gEQ-1; Thu, 25 Jun 2020 15:15:13 -0400
X-MC-Unique: MyBnWwG-No6f5BDwu75gEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59584EC1A1;
	Thu, 25 Jun 2020 19:15:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FF3E5C240;
	Thu, 25 Jun 2020 19:15:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF17F1809547;
	Thu, 25 Jun 2020 19:15:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PJErvw005272 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 15:14:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1197F8820; Thu, 25 Jun 2020 19:14:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3A5F84D7
	for <linux-audit@redhat.com>; Thu, 25 Jun 2020 19:14:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3340805C1C
	for <linux-audit@redhat.com>; Thu, 25 Jun 2020 19:14:51 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-291-6KK98qBxOlej_ckh6Qc0DQ-1; Thu, 25 Jun 2020 15:14:46 -0400
X-MC-Unique: 6KK98qBxOlej_ckh6Qc0DQ-1
Received: by mail-ed1-f65.google.com with SMTP id e15so5093415edr.2
	for <linux-audit@redhat.com>; Thu, 25 Jun 2020 12:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pD7cDE1pRowKa97y2ug2GlsIr3bcaoCdNkFbx1fxc3o=;
	b=SvDpSUyG9fWLgqzAVyMbjZpFuwHN30v//EqXho6X9g+HZMZy3fA0qWcez1D+9RHaCP
	TcS6skIIuk6AQmHW4lK6TcCBhKUsQe28IsPIB1YJcxOF2JCvH1aRZ3zSdF/XLrft3SAU
	8jOT07kwB7hEwJ/FrBNG5Kwp0niQJXgMPNRbovL+WP2A8LspZu4JwQeOyBIIeSgcClhy
	SkfAwDkTmyZwRIgXuhy7BtGWLj/Ykj6JxBJ2H4bHrJvFvl0xF0kSuebVP8p8tq01bC27
	jL/LcnYoikOSlQBGXkWBOAdaB7ZF+uKY8aAI4hG7ZY7+ICd8LDOvYr9b7RUvC+l2haVH
	BSGw==
X-Gm-Message-State: AOAM532AAr511DrEwQdNqPSiaviC1p8VJh6myOwr7V5ZxuYZdApS6/He
	12PmJau0f27MllBI7LkL495KP0ZmARwtvN2ekZ/z
X-Google-Smtp-Source: ABdhPJwBF+4tgJZEQxIu8g09LpmP3KY3mtsOD8kLQZvMUBINU09oYuesxtYvtDT3DUBp28CQyH/S4RxLZI9OlHqM0Ig=
X-Received: by 2002:aa7:cd52:: with SMTP id v18mr27675622edw.196.1593112485180;
	Thu, 25 Jun 2020 12:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200618211012.2823-1-nramas@linux.microsoft.com>
	<20200618211012.2823-2-nramas@linux.microsoft.com>
	<1592942295.5389.9.camel@linux.ibm.com>
	<39d66bdc-55be-984a-42a0-34d0a011e0fb@linux.microsoft.com>
In-Reply-To: <39d66bdc-55be-984a-42a0-34d0a011e0fb@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 25 Jun 2020 15:14:34 -0400
Message-ID: <CAHC9VhRQru30WtA-CMeqq=0GBtZ-Ut20ecHwpYfbEu5qCFqgDg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] IMA: Add audit log for failure conditions
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>, linux-audit@redhat.com,
	linux-integrity@vger.kernel.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 24, 2020 at 1:25 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> On 6/23/20 12:58 PM, Mimi Zohar wrote:
>
> Hi Steve\Paul,
>
> >> Sample audit messages:
> >>
> >> [    6.303048] audit: type=1804 audit(1592506281.627:2): pid=1 uid=0
> >> auid=4294967295 ses=4294967295 subj=kernel op=measuring_key
> >> cause=ENOMEM comm="swapper/0" name=".builtin_trusted_keys" res=0
> >> errno=-12
> >
> > My only concern is that auditing -ENOMEM will put additional memory
> > pressure on the system.  I'm not sure if this is a concern and, if so,
> > how it should be handled.
>
> Do you have any concerns with respect to adding audit messages in low
> memory conditions?

Assuming the system is not completely toast, the allocation failure
could be a very transient issue; I wouldn't worry too much about it.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


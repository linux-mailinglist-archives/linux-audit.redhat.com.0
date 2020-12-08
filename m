Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCB92D36B6
	for <lists+linux-audit@lfdr.de>; Wed,  9 Dec 2020 00:09:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-HQtRfH9mMz6CB99c1qaXQQ-1; Tue, 08 Dec 2020 18:09:22 -0500
X-MC-Unique: HQtRfH9mMz6CB99c1qaXQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5211C1005513;
	Tue,  8 Dec 2020 23:09:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25EA660BE2;
	Tue,  8 Dec 2020 23:09:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52AF8180954D;
	Tue,  8 Dec 2020 23:09:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8N8wk7023837 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 18:08:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A279A9FDF; Tue,  8 Dec 2020 23:08:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54120A9FD5
	for <linux-audit@redhat.com>; Tue,  8 Dec 2020 23:08:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B75F858287
	for <linux-audit@redhat.com>; Tue,  8 Dec 2020 23:08:56 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-213-DYVi_PazP5SdyrXqg3tGzQ-1; Tue, 08 Dec 2020 18:08:53 -0500
X-MC-Unique: DYVi_PazP5SdyrXqg3tGzQ-1
Received: by mail-ej1-f66.google.com with SMTP id f23so285069ejk.2
	for <linux-audit@redhat.com>; Tue, 08 Dec 2020 15:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mLyv9k8Y2YtCHv9EdjtCYMGH+hDXsITc+s2+MGTY5Es=;
	b=O1GBBHlUxQO7NlJhFhv+25A6zaKuVUo5G/Y9Ww4S1sLEKRD/DcL/Ogj2X450G4SloZ
	COgiQI1xyR+t4yZH5Df7nXosUSQQyx/e/2boP2G06LmuvSN9dPAhbMwCvwOwio3WFzLi
	Gvo0LHHy9/sWhvJFQzpbvYQlfFtyPdKu7W7CGeSq/yMVqB9LjgyyVaxhsv/knYHZUXJq
	8QgsVscP6H8hx4WovLFgxBqXCLVvxqztIOnoiIEVQxyqqiTYRTnwnnaDEWuQ34WJC6Ud
	lWE3qwyESSBPyu1tYO2EEzQnsdOxkehlftJMT9RPQ5cWKxX+xoH4fwvC6soeXvnIHlWf
	k9yw==
X-Gm-Message-State: AOAM533KhHG2JPT4gJWTEZPOBx3QJoGz7a2Ej2HG3qLguAySnQckfqQS
	MQzU0j5tiH9LTrSCqu1iER6dtZ/0UNmkpIQYh75LmrkkNxrt
X-Google-Smtp-Source: ABdhPJyD7KCmLVo6tfItnIKVT8Yhri+9DFaYySWuxxzaWD5MeJNkA+31hHiNcJZq+3s0ltmtauZx/VODdWZoZzb90rk=
X-Received: by 2002:a17:906:c096:: with SMTP id
	f22mr10406ejz.488.1607468932013; 
	Tue, 08 Dec 2020 15:08:52 -0800 (PST)
MIME-Version: 1.0
References: <20200701213244.GA1817@linux-kernel-dev>
	<20201207212100.GN986374@madcap2.tricolour.ca>
	<CAK50otWFQveN3GSBVEz07cnSR90YOb0QeiX-PJzB4W2rkJ02ow@mail.gmail.com>
	<2046910.irdbgypaU6@x2> <20201208013435.GU1762914@madcap2.tricolour.ca>
In-Reply-To: <20201208013435.GU1762914@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 8 Dec 2020 18:08:40 -0500
Message-ID: <CAHC9VhTAxUKiqJuYu9ehrDEso=cUF1nNB9R-gJbm+NnW4jLrDg@mail.gmail.com>
Subject: Re: [PATCH v2] audit: report audit wait metric in audit status reply
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 7, 2020 at 8:34 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-12-07 18:28, Steve Grubb wrote:

...

> > Other metrics would be good. I'd like to see a max_backlog to know if we are
> > wasting memory. It would just record the highwater mark since auditing was
> > enabled.
>
> That would be covered with this issue:
>         https://github.com/linux-audit/audit-kernel/issues/63

For those who haven't clicked on the GH issue above, increasing the
queue depth doesn't result in wasted memory; memory is allocated as
needed and released when it is no longer used.  Simply increasing the
backlog size doesn't increase the amount of memory used in the kernel
by audit until the backlog queues start to fill.  Once the backlog is
cleared by auditd then the memory is released.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


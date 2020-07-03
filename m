Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEA0213B46
	for <lists+linux-audit@lfdr.de>; Fri,  3 Jul 2020 15:41:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-7eMrJbTKOvutWj2H2GZSzg-1; Fri, 03 Jul 2020 09:41:41 -0400
X-MC-Unique: 7eMrJbTKOvutWj2H2GZSzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37EE61902EA1;
	Fri,  3 Jul 2020 13:41:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAE0A6FEFB;
	Fri,  3 Jul 2020 13:41:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAA026C9CB;
	Fri,  3 Jul 2020 13:41:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063DfSEV008456 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 09:41:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4AC3B10F2718; Fri,  3 Jul 2020 13:41:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4480610F2712
	for <linux-audit@redhat.com>; Fri,  3 Jul 2020 13:41:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23A02924907
	for <linux-audit@redhat.com>; Fri,  3 Jul 2020 13:41:24 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-391-65TuWBHYN4qTLjxxUHpN7g-1; Fri, 03 Jul 2020 09:41:19 -0400
X-MC-Unique: 65TuWBHYN4qTLjxxUHpN7g-1
Received: by mail-ej1-f68.google.com with SMTP id l12so34242038ejn.10
	for <linux-audit@redhat.com>; Fri, 03 Jul 2020 06:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7uF7g65N0fhkNRDQWLvCnLMIuNK+JZWHI0AnyxJK8Ns=;
	b=lV+JgyCjntYgmtzF1lGNheuFWjZZRk/bW/EhQa+ENHxMP5rcxaPZVNni1fkM6bQA0W
	CvROJVPVs+cCiIrgzDjy6SRoiPMurjRZ4B/PheuzXh/04QA2UL3aa0euk5RGyYctlYfk
	3k77R0Ad4jn46LslHkUPqJVR7UQsFQGtjWJjJSdzlztQXZrQWYHMIbcLkaRClS8/gn4q
	SBAPrXrcAj20ZrDpONVpEHrpDyrgmT1vgY1N+49+Q0AAp8aIfjGDn7zZMVx5IDQS8dJy
	dVmNcfpCOfXGsGJ30pEFtAO5B7W913I0vPlsG4CDNJfN3V9oTBY6nIEUfaDnaVJUyeXo
	znig==
X-Gm-Message-State: AOAM530Xw1GLb2rXn24lTqO67METbEfR06aW3XWjSZdW5BK9f2xFY3rc
	XNCanhGQ9QxgYCfwrwL3RfIu02BBwa6H6dR5AUR+
X-Google-Smtp-Source: ABdhPJzEh3lYbHXZEZtaKYGhHDXIHK+g9iZaSuhvY5ttt1AM1p+O7sOeZk0mCwWZe6VIAYYHBFBu95zncE/y13PnKdA=
X-Received: by 2002:a17:906:456:: with SMTP id
	e22mr26778131eja.178.1593783678300; 
	Fri, 03 Jul 2020 06:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <3eda864fb69977252a061c8c3ccd2d8fcd1f3a9b.1593278952.git.rgb@redhat.com>
	<CAGdUbJEwoxEFJZDUjF7ZwKurKNibPW86=s3yFSA6BBt-YsC=Nw@mail.gmail.com>
In-Reply-To: <CAGdUbJEwoxEFJZDUjF7ZwKurKNibPW86=s3yFSA6BBt-YsC=Nw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 3 Jul 2020 09:41:07 -0400
Message-ID: <CAHC9VhTYy5Zd6kB77xYL6HbnqL29AL6jF8RzVAN6=UC6eVLqCg@mail.gmail.com>
Subject: Re: [PATCH ghak124 v3fix] audit: add gfp parameter to audit_log_nfcfg
To: Jones Desougi <jones.desougi+netfilter@gmail.com>,
	Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: Florian Westphal <fw@strlen.de>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org,
	dan.carpenter@oracle.com
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

On Fri, Jul 3, 2020 at 8:41 AM Jones Desougi
<jones.desougi+netfilter@gmail.com> wrote:
>
> Doesn't seem entirely consistent now either though. Two cases below.

Yes, you're right, that patch was incorrect; thanks for catching that.
I just posted a fix (lore link below) that fixes the two problems you
pointed out as well as converts a call in a RCU protected section to
an ATOMIC.

https://lore.kernel.org/linux-audit/159378341669.5956.13490174029711421419.stgit@sifl

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


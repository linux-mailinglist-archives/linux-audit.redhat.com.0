Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4C12B1737B6
	for <lists+linux-audit@lfdr.de>; Fri, 28 Feb 2020 13:54:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582894495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jkL11ucA8HphaiYTb8aVGUwch9XP5IFbZGlUXuMLBTg=;
	b=alCj8jtPwkH1eRwI83HrRlkCgzegDr1U9Rk6KS7b1jmdPMMrLTKicnMuMgcno60/08z8Oz
	Dd9C1aSO/qyqdpqrSsPPloILd1o2iR2IPodK8S4Oe5bAXjO87zADcVQGlvsoQj0GV5QQ0C
	tc8rQb2nfuqCsGYs7kF2fk+2bNgEId0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-TDCxQLwgNKG3i_MKCpd2xQ-1; Fri, 28 Feb 2020 07:54:53 -0500
X-MC-Unique: TDCxQLwgNKG3i_MKCpd2xQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56E7C8010E3;
	Fri, 28 Feb 2020 12:54:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E81E60BE0;
	Fri, 28 Feb 2020 12:54:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C42D84486;
	Fri, 28 Feb 2020 12:54:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SCsTxs021491 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 07:54:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E86582022EAC; Fri, 28 Feb 2020 12:54:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E100620230A6
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 12:54:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B14488007AC
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 12:54:26 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-364-pxe0Et_MNU-Qb7PjQJyDEQ-1; Fri, 28 Feb 2020 07:54:24 -0500
X-MC-Unique: pxe0Et_MNU-Qb7PjQJyDEQ-1
Received: by mail-ed1-f66.google.com with SMTP id t7so3236462edr.4
	for <linux-audit@redhat.com>; Fri, 28 Feb 2020 04:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Uw9leu97x2ESi5XHyZhqbJLZ2N/N1E5jmbRkjD8CRtM=;
	b=ltBYW6G5eFL+oWCh66D74i27oAgy9EHHWTAw/1w5WiSuJvK+jqpSY3Krcnq9Iz2JIr
	QTc+Cm5IiGKI/55Jy7cUk1J92hzfB8hNcR854IuL90ngvMB4nML398cQuOpPAX9N/Y+i
	FeOIxS/t4cYZl7GVX2RXo6855/NUMLwN6y6e1eWao7vafAFTB88Zybi7qT+zdvpL78pb
	N5An54aDmUFgymi00kUHi26BC5XNuThkQPuE+/S0AlqPO7xoAxz4G3dJflq5MYaveuY3
	wqeqJEG6Cw3HMGYgkwTUZRRCK5mfTWJ8732xg9wmHd7lM3mnNEx++XbTzyyABqSknYyV
	6WyQ==
X-Gm-Message-State: APjAAAW75K5tnZePTJWaaxKU0kaCEwKGUIzuXYhY+GA2wsSUvbvF8Jef
	Z6wvFEO/HMeMso1y5dPyGG7WK/2t0D9IyiDPHAD1FEdZVA==
X-Google-Smtp-Source: APXvYqy5Fi/Map9NNcMssiaRL78EX2EqCMAiYg6BnYqJr5L6kgueQNh5MjXqusvonoSL4TOLL5SXS5HbUrWyjOxu4aI=
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr4134473edc.128.1582894462311; 
	Fri, 28 Feb 2020 04:54:22 -0800 (PST)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 28 Feb 2020 07:54:11 -0500
Message-ID: <CAHC9VhSArYptTivNUkZkyUAo86yb6vvOp7TZAVNsy1LLrnj=Vg@mail.gmail.com>
Subject: New linux-audit mailing list archive on lore.kernel.org
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01SCsTxs021491
X-loop: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello all,

I'm happy to announce that lore.kernel.org is now archiving the
linux-audit mailing list (below).  The redhat.com archive isn't going
away, so if you are happy with that there is no reason to stop using
it, this is just another archive (always a good idea) with some nice
functionality not present in the redhat.com archive.

* https://lore.kernel.org/linux-audit

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


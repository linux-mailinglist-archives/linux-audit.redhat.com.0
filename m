Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 76107B5653
	for <lists+linux-audit@lfdr.de>; Tue, 17 Sep 2019 21:42:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BB4B10CC1F8;
	Tue, 17 Sep 2019 19:42:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 441B660852;
	Tue, 17 Sep 2019 19:42:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B6DC4EE68;
	Tue, 17 Sep 2019 19:42:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8HJftmq031748 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 15:41:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 539436013A; Tue, 17 Sep 2019 19:41:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D8E16012C
	for <linux-audit@redhat.com>; Tue, 17 Sep 2019 19:41:52 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 573D4C049D59
	for <linux-audit@redhat.com>; Tue, 17 Sep 2019 19:41:52 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id r2so3814126lfn.8
	for <linux-audit@redhat.com>; Tue, 17 Sep 2019 12:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=2wIqHgo/8bnd2n8GrOghGpsD7glGx9O2YeTzOGqjFX8=;
	b=oJbZc/qYSVVSmNWfreeBfiwaUGh9dcetmArap/5uRSH6s+5r/rtfVR9sHeCnHEKG8s
	Nhodf6Jd5GCEHWXStLUtSFYTtShlk7v8F79c8Th6Hxi6ZSXHZMC5RiJOV9nAbwQ4giIw
	TMsoEZ2+NQKE6QK3qbfkbzYILME1fHENnifWkmu2nTBF7ERzqXjyPFicqDSBOf0bp20g
	rtII1lOAikEBZrJBCsryMPwEfxfaLufNHvkunjIMlQDdC7xxtPjuutqUzhJrRiEMpyM1
	CMKljzy3rEz7E5QVYcJt5uCmrkPJtVczpnLowgJ66pVmY0uu3FJD0N8aF38fHkopH+4m
	KG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2wIqHgo/8bnd2n8GrOghGpsD7glGx9O2YeTzOGqjFX8=;
	b=Ic2D7t9KSorXDPYYf3BUcD6j+BxMQIJyC1OK2br+5gJ58C2K5V9YRu+WTjdBERjmAv
	SkNcz3VvP5Y6eiconyqfCLHBY4e00oGpagJOyERm74Ay8oEUaGLiZc5hycRroMpDKvwz
	pjUZ1zAUx8dlP4hK4e1ffyfxPBtnW6EsGK4Bc8NRFOo/1nrcPXKBPRw18nMDNlwz+JTL
	2Ngaj6lrn/7RSFk3o8DCXa2yYbsSR3LDc2rJnhMHnymzEfAdoGRK7NPyOIkytFXRvq8c
	HTUivC6eqXMrs4N2b0G8XxF2fvbAw0cikfWt5QB5nuJXffdhwPue4BvfZQJaTAUaEpxD
	hKJw==
X-Gm-Message-State: APjAAAVHFwZUbbBjSZKWQ/Tlv5Qk6dGibB+srGS/eWn1yQ9d6ScEcwl1
	AFzEwSuD/sZ0aGaq4XJIOKaTofLybXXsBMep9D1+y2NDFA==
X-Google-Smtp-Source: APXvYqxX0YkdZ0wFDpZ6BG3mduELSXH0XrNoE6+UpQWNVMd+Prz9z6TM8/6xggxjbBpCr5mQdInBZJA9xZoJEIobQVQ=
X-Received: by 2002:a19:6517:: with SMTP id z23mr1307lfb.31.1568749310105;
	Tue, 17 Sep 2019 12:41:50 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Sep 2019 15:41:39 -0400
Message-ID: <CAHC9VhTe5vDJGsyQp+iHNQnK+SX9HSmsqnas44+eeNkFiFJZpw@mail.gmail.com>
Subject: No audit/next patches for the v5.4 merge window
To: linux-audit@redhat.com, linux-kernel@vger.kernel.org
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 17 Sep 2019 19:41:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 17 Sep 2019 19:41:52 +0000 (UTC) for IP:'209.85.167.45'
	DOMAIN:'mail-lf1-f45.google.com' HELO:'mail-lf1-f45.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.45 mail-lf1-f45.google.com 209.85.167.45
	mail-lf1-f45.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Tue, 17 Sep 2019 19:42:06 +0000 (UTC)

A quick note in case anyone was wondering ... we don't have anything
queued up in audit/next for the v5.4 merge window, so no audit updates
this time around.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

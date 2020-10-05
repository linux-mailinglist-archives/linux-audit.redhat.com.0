Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2931E283F50
	for <lists+linux-audit@lfdr.de>; Mon,  5 Oct 2020 21:09:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-6Qno_yGrOoqLA7Kf6N5_Jw-1; Mon, 05 Oct 2020 15:09:16 -0400
X-MC-Unique: 6Qno_yGrOoqLA7Kf6N5_Jw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA6AB107ACF9;
	Mon,  5 Oct 2020 19:09:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1111610013C0;
	Mon,  5 Oct 2020 19:09:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDA7B44A65;
	Mon,  5 Oct 2020 19:09:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 095J7UxA025922 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 5 Oct 2020 15:07:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0D48111285B; Mon,  5 Oct 2020 19:07:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC43B111285A
	for <linux-audit@redhat.com>; Mon,  5 Oct 2020 19:07:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92DCB801184
	for <linux-audit@redhat.com>; Mon,  5 Oct 2020 19:07:28 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-423-7uyRuwnSMCW-UcbN1GwJFQ-1; Mon, 05 Oct 2020 15:07:25 -0400
X-MC-Unique: 7uyRuwnSMCW-UcbN1GwJFQ-1
Received: by mail-lf1-f52.google.com with SMTP id w11so12217858lfn.2
	for <linux-audit@redhat.com>; Mon, 05 Oct 2020 12:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=pbTe0S99lsxF4KtUWaG86+6WssBcTuzUf858N9Ydj6M=;
	b=AB45l2y/XfapIT8n6FfkHMEuWp24whRvsS8FJAzDS2ysaDJ3iwEyljRXqvctXdR644
	WkwROuhsFIpYZqPFodHuz+e32ddcCo0sxfXlnqXAetS4fZjO8+aQoivQ0JuKCE7YEhUA
	+TZw+AGhMb22frINEy4lyvIdg+Rkczz98i7qOd67ILEzlm1YyR++nEKVbO/n+Ely0zMB
	gXwYs/bZ4v4iZxnDZ4e+4rlWBUzfWoyQz+1n+4oMIi281KIwt0a6HSDrVHN48xvRNW+V
	tsvG2I3APvk8323I/BSOSc77ITCzIVZL9nZFNkMaPjclLv8m8LywA0CpMIDDbkbtSeMB
	7AMQ==
X-Gm-Message-State: AOAM533K7rQDG84PVtFhB/Y1uIZbofqKKwl+KodIC9jilj538HGP5JRN
	JhAKNgM4RAMkefKsUrnHyn2Nx3DHBqtmZS7Fu0GHXBLECS0=
X-Google-Smtp-Source: ABdhPJxWRLjhFmcaEUtFsTvZiu3IMaoiARL8F7gByIvgqvEom4MKWyxhCzk+BW6DHm1jorpD29YrB2yMxh+IUNNoHAU=
X-Received: by 2002:ac2:5048:: with SMTP id a8mr294076lfm.60.1601924843632;
	Mon, 05 Oct 2020 12:07:23 -0700 (PDT)
MIME-Version: 1.0
From: Natan Yellin <aantny@gmail.com>
Date: Mon, 5 Oct 2020 22:07:12 +0300
Message-ID: <CAPErmPdDACGemKqTrUk4xKNBwnoj6FEeWbsvmk7jS0TjOyaOqg@mail.gmail.com>
Subject: Identifying thread/process termination
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2339488884284492940=="

--===============2339488884284492940==
Content-Type: multipart/alternative; boundary="00000000000042fd1505b0f1317c"

--00000000000042fd1505b0f1317c
Content-Type: text/plain; charset="UTF-8"

Hello,
I've been tracking all process terminations using a rule for the exit and
exit_group syscalls. However, by looking at the audit events for exit it is
impossible to differentiate between the death of different threads in the
same thread group. Is there an alternative way to track this?

For my use case, I would like to know when either processes or individual
threads execute and terminate. (I'm fine tracking at either granularity.)
Right now I can track the creation properly using fork/clone/etc but for
termination I receive multiple exit events with identical information that
doesn't let me know which thread died.

Thanks,
Natan

--00000000000042fd1505b0f1317c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>I&#39;ve been tracking all process terminations=
 using a rule for the exit and exit_group syscalls. However, by looking at =
the audit events for exit it is impossible to differentiate between the dea=
th of different threads in the same thread group. Is there an alternative w=
ay to track this?</div><div><br></div><div>For my use case, I would like to=
 know when either processes or individual threads execute and terminate. (I=
&#39;m fine tracking at either granularity.) Right now I can track the crea=
tion properly using fork/clone/etc but for termination I receive multiple e=
xit events with identical information that doesn&#39;t let me know which th=
read died.</div><div><br></div><div>Thanks,</div><div>Natan</div></div>

--00000000000042fd1505b0f1317c--

--===============2339488884284492940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============2339488884284492940==--


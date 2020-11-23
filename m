Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C02052C0D26
	for <lists+linux-audit@lfdr.de>; Mon, 23 Nov 2020 15:22:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-MM9eyel5OV2xXMUFe_i6VQ-1; Mon, 23 Nov 2020 09:22:40 -0500
X-MC-Unique: MM9eyel5OV2xXMUFe_i6VQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F2835225;
	Mon, 23 Nov 2020 14:22:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 160F419D7C;
	Mon, 23 Nov 2020 14:22:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3036A180954D;
	Mon, 23 Nov 2020 14:22:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ANEMIxc003607 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Nov 2020 09:22:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 80C5A1004041; Mon, 23 Nov 2020 14:22:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B8AC1111455
	for <linux-audit@redhat.com>; Mon, 23 Nov 2020 14:22:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83A45811E99
	for <linux-audit@redhat.com>; Mon, 23 Nov 2020 14:22:15 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-431-wTx4oX53MNmatZUxwOtfkA-1; Mon, 23 Nov 2020 09:22:10 -0500
X-MC-Unique: wTx4oX53MNmatZUxwOtfkA-1
Received: from mail-pg1-f200.google.com ([209.85.215.200])
	by youngberry.canonical.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <andreas.hasenack@canonical.com>) id 1khCjJ-0002an-Cx
	for Linux-audit@redhat.com; Mon, 23 Nov 2020 14:22:09 +0000
Received: by mail-pg1-f200.google.com with SMTP id f19so12591353pgm.4
	for <Linux-audit@redhat.com>; Mon, 23 Nov 2020 06:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=HDqWrRZqepSmUwPSGjh+bbTDunyNb3I3rpkf534+t88=;
	b=TmOtbwbaYUd+S0JMyUY49arII503HMI+AFWzVJgH72e0wrV0zVUTwWJW+KFKJ0DYuG
	P5UQvmAeR/DgzPDAsnNY8LYWBx0Ous8ZEj9Ryb0HNGBg0eJs7A8x4nlMmksuMtGiJ4dv
	1XI0XnFQsbE9yqL6gMoJZHRB2jnn1MIQsQr62A9agcUdVb5+cRC8OVjv2lBvSJiziwvQ
	stAufatd59X5g6mqGALbVYrMj1Ib9VNzlHZchXJF54oe+a3O5PD4hTj4iGJ1Dx3W+xKL
	EArj/tWU52J1lnV499whdLdoHXeMTkXUt6Bi4Fy1KQgxdQx2lpq65knuadYCgVfUkXm+
	pKuw==
X-Gm-Message-State: AOAM530NAsnHBNTAwEwfmjA/h4uwJTMkURN/n9Oj8NOErDyvAu+piqOr
	byKYGa9zYefA6orYIDUzoe4KW238DOhF4WORwMLzd7mDpn6vAdbKJdf1bYgmPTe4r1YSrO8seSj
	LR6qA4CVr8vHij+mbOZaQYer6Yr9V+CYDkZV03tnWf4tC4EQzhg==
X-Received: by 2002:a17:902:a504:b029:d8:ebc7:a864 with SMTP id
	s4-20020a170902a504b02900d8ebc7a864mr23077731plq.60.1606141327951;
	Mon, 23 Nov 2020 06:22:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjRezQnmaS0dtJLg+5sUf7J7y8Ea/t4tQJUEfuSzBUOQjzSdWGuEhqLXkwIiPc5T/M5etWS97NkuHrBQbo9XY=
X-Received: by 2002:a17:902:a504:b029:d8:ebc7:a864 with SMTP id
	s4-20020a170902a504b02900d8ebc7a864mr23077723plq.60.1606141327697;
	Mon, 23 Nov 2020 06:22:07 -0800 (PST)
MIME-Version: 1.0
From: Andreas Hasenack <andreas@canonical.com>
Date: Mon, 23 Nov 2020 11:21:56 -0300
Message-ID: <CANYNYEE1kBF1mDFUGhd7uJUHX8Bth9Qmhk0WKE4V+nNaYCnz0w@mail.gmail.com>
Subject: Clarification on log rotation
To: Linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'm checking auditd's native logrotation mechanism.

The auditd.conf manpage states this for num_logs:

"The excess log check  is  only  done  on startup and when a
reconfigure results in a space check."

I kept generating events, and truth be told, no rotation happened once
the logfile size was above max_log_file. At least not after a few
minutes.

When does a space check happens, besides on a restart? Just external
events likg SIGUSR1 and perhaps SIGHUP?

Since these are external events, how do sysadmins deal with log
rotation: completely ignore auditd's native mechanism and setup
logrotate as usual?

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


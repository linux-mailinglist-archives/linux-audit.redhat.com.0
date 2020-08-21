Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D575D24E2C0
	for <lists+linux-audit@lfdr.de>; Fri, 21 Aug 2020 23:35:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Mu6WN84WMuCA80FbCJPucg-1; Fri, 21 Aug 2020 17:35:54 -0400
X-MC-Unique: Mu6WN84WMuCA80FbCJPucg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 648D21DE03;
	Fri, 21 Aug 2020 21:35:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F4EB5D9CC;
	Fri, 21 Aug 2020 21:35:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9148662CF;
	Fri, 21 Aug 2020 21:35:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LLZU9K026486 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 17:35:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59CE81006EC9; Fri, 21 Aug 2020 21:35:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 562D91006EB6
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 21:35:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 071D3811E90
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 21:35:28 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
	[209.85.218.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-299-cGMV9SUkPuuFsVh86zOEqw-1; Fri, 21 Aug 2020 17:35:24 -0400
X-MC-Unique: cGMV9SUkPuuFsVh86zOEqw-1
Received: by mail-ej1-f50.google.com with SMTP id m22so4115348eje.10
	for <linux-audit@redhat.com>; Fri, 21 Aug 2020 14:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=d8TSD6Ho7yKw6sYbG1iFTh6PZ0qyJSUCv+RLIpBqGAw=;
	b=doMP1v3rIrzRvomS01RFqRu9alLSILhCk7UUIkREf9v41tZywWenJcaFNs16attut2
	4OauNpsMj9JpA7uBHcOsI5PqjAPPhpHelWB/blD0Huwyq7T8F9Lgq+vP8OylWqhhNdLx
	3xOw1PpXDXpwxIIy9MPfxn5+rJK8PlJY3USiSMguSUZih/5+3dzZ1lNypYFrC/PkKN5D
	W7bpQ6ztpUrUaYhjKjMbn04l66L+D0xYC+pczgjOc6kWxhXUaKSSStAxTrI7krRERQYj
	raGhnfOxn7TqsFDNxibETycrW96r9jIkkqTIv0rz4cBhLPxQeHq5P2WKABV01oI8m4WM
	KR7w==
X-Gm-Message-State: AOAM530khFRp0nZwG2uEx8Sfcrx7eMjpllOz2FAQCFheFjHKch3wzVZa
	Af/ioGdMZoQNN9BDI4NIF+s3+E20GyqbD/r9qXRwrZwHulJtoi0=
X-Google-Smtp-Source: ABdhPJy+z7z062/mrfF+Lba8KgFZKc5H9uEoP0RorE4bHIUdu3St7m3e3AdToPA8fwFFNpE3+fEC5vYg9FQn0BEIqOs=
X-Received: by 2002:a17:906:5205:: with SMTP id
	g5mr815357ejm.488.1598045723024; 
	Fri, 21 Aug 2020 14:35:23 -0700 (PDT)
MIME-Version: 1.0
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Aug 2020 17:35:12 -0400
Message-ID: <CAHC9VhQXYuS8_tK6NQxXw-cn_+6xJ=RMD_9u=z=DFjgSi=pF2Q@mail.gmail.com>
Subject: Administrivia
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A heads-up that I've replaced the "master" branch in the audit
kernel repo with the "main" branch.  This should have little to no
practical impact, but if you run into problems let me know.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


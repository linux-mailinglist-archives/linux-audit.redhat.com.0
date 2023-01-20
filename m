Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A16760D4
	for <lists+linux-audit@lfdr.de>; Fri, 20 Jan 2023 23:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674255493;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nPR1z5phsX0w5dHuoMrfg38e3dkYFG5IGcjpmm1x6Vs=;
	b=UaNodG+vVDNWjfDpRJ/YHl2oam9xL0ovBrfH0uvMqKGUanfxihAE8u5o9CvOTnJG9a+OIf
	Y9F+d/jUWl8bx8irxQMacHJUBcynle1MTBAY8N/LUDhC38tR+S+wMEA4yzxg5+EQQKiG/M
	NBcUOsQzPNtPai/gWp9tWkHTVKgP8e0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-Q2YxmL-ANRi8H_Svs6eLZQ-1; Fri, 20 Jan 2023 17:58:10 -0500
X-MC-Unique: Q2YxmL-ANRi8H_Svs6eLZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DAC7801779;
	Fri, 20 Jan 2023 22:58:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03C1053AA;
	Fri, 20 Jan 2023 22:58:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E7B741946A77;
	Fri, 20 Jan 2023 22:58:02 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4A5861946588 for <linux-audit@listman.corp.redhat.com>;
 Fri, 20 Jan 2023 22:58:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29DF239D92; Fri, 20 Jan 2023 22:58:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2161F53AA
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 22:58:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05443811E9C
 for <linux-audit@redhat.com>; Fri, 20 Jan 2023 22:58:01 +0000 (UTC)
Received: from mail.namei.org (namei.org [65.99.196.166]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-226-MtW4OeKJNrSKJTJC0me8tQ-1; Fri,
 20 Jan 2023 17:57:59 -0500
X-MC-Unique: MtW4OeKJNrSKJTJC0me8tQ-1
Received: from localhost (localhost [127.0.0.1])
 by mail.namei.org (Postfix) with ESMTPS id E3C12AD;
 Fri, 20 Jan 2023 22:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org E3C12AD
Date: Sat, 21 Jan 2023 09:24:57 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: linux-security-module@vger.kernel.org
Subject: [ANNOUNCE] Linux Security Summit North Americ (LSS-NA) CfP
Message-ID: <3a8f10eb-df2-cfad-1d-5aeab14568e@namei.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: Linux Security Summit Program Committee <lss-pc@lists.linuxfoundation.org>,
 keyrings@linux-nfs.org, gentoo-hardened@gentoo.org,
 kernel-hardening@lists.openwall.com, selinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, tpmdd-devel@lists.sourceforge.net,
 Audit-ML <linux-audit@redhat.com>, linux-crypto@vger.kernel.org, lwn@lwn.net,
 linux-integrity@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Call for Participation for the 2023 LSS-NA conference is open!

See details of the event and information on submitting proposals here:
https://events.linuxfoundation.org/linux-security-summit-north-america/

LSS-NA 2023 will be in Vancouver, BC, Canada, from May 10th to May 12th. 
This will be a three day event, co-located with Open Source Summit North 
America [1].

The LSS-NA CfP is open until March 1st, 2023.


Note that announcements relating to the Linux Security Summit may be found 
now on the Fediverse, via: https://social.kernel.org/LinuxSecSummit


-- 
James Morris
<jmorris@namei.org>


[1] https://events.linuxfoundation.org/open-source-summit-north-america/

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


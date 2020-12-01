Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3452C9682
	for <lists+linux-audit@lfdr.de>; Tue,  1 Dec 2020 05:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606797064;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hSOaJXs6KlmAVZdYJgR70sPwdaJ0IAv5u93Ve89cIvM=;
	b=HOHJHVy6DC/d6wUv+L7eQNEOpQJz0bjW3UOro70/5hnQMahYNHZCHEfd6bzIyS7JvI+3B3
	FFFrmPrWtgpkAoAwKmSE6Ff1gsnNYAO1iie7vELbAKFuIrLSHfKn3z+hkU7EhnChX5/8DC
	e+rpVBiye76mXonxByCmWWZZKOhMh2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-xPcTFf9NM9S3NSGdQvcecA-1; Mon, 30 Nov 2020 23:31:01 -0500
X-MC-Unique: xPcTFf9NM9S3NSGdQvcecA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 960B81842143;
	Tue,  1 Dec 2020 04:30:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 692615D71D;
	Tue,  1 Dec 2020 04:30:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFE42180954D;
	Tue,  1 Dec 2020 04:30:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B14Udd8013963 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 23:30:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 78C9D60C69; Tue,  1 Dec 2020 04:30:39 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-112-148.rdu2.redhat.com [10.10.112.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29F0160BE2;
	Tue,  1 Dec 2020 04:30:36 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: New release?
Date: Mon, 30 Nov 2020 23:30:35 -0500
Message-ID: <5562559.MhkbZ0Pkbq@x2>
Organization: Red Hat
In-Reply-To: <10188dab-63c3-4bc3-e950-37a9b3d7ac73@debian.org>
References: <10188dab-63c3-4bc3-e950-37a9b3d7ac73@debian.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Sunday, November 29, 2020 6:37:36 PM EST Laurent Bigonville wrote:
> The freeze of the new debian release is approaching (early next year)
> and I'm looking a bit for guidance about what do with the audit package.
> 
> Should I start cherry-picking patches, wait for a new (pre-)release?
> Keep the good 2.8?

The good 2.8 is rotten. It has not been patched for a very long time. Fedora 
and RHEL are running off of github snapshots. I usually do a prerelease 
tarball for everyone else to follow along with so that we can all stay in 
sync. Hopefully, you have been using those. 

The pre-release is perfectly good releases. I have been holding off on 
calling it 3.0 because the major feature was container support. This has been 
perpetually almost done for the last 5 years. I apologize for holding the 
release up for something that is always out of reach, yet almost done.

I have one open question on:
https://github.com/linux-audit/audit-userspace/pull/134

and I think that might wrap things up for 3.0. We cannot wait for the 
container work. It seems like the patch above is missing the use of a 
AUDIT_FEATURE_BITMAP_ extension and then we are good to go.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


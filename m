Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id D0B1E194DFD
	for <lists+linux-audit@lfdr.de>; Fri, 27 Mar 2020 01:29:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585268970;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/RAJknUYfeGm6QFVbzmidj4LrAV5y3qUpJZ2lUU7cyQ=;
	b=LRmpZPeIouxsId6UXK2Cu/Cus5WaG3VIgmSv1rF+fkMCptZu2sV9l8y6ZDNp4JfWpTphLT
	Mv7Xtzq5sk+WwNSTs9s2/iU0hTlYLQNWiLd/SyQ/X7zIa00/oyhc6A37dapcvNxI+Wn93w
	kI9pEJXlAEqtZEs12wf5G+j1KkB91Ps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-WboR1TFTP1qC8ZPoJ0OPzQ-1; Thu, 26 Mar 2020 20:29:28 -0400
X-MC-Unique: WboR1TFTP1qC8ZPoJ0OPzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EACAD107ACC4;
	Fri, 27 Mar 2020 00:29:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A2D92FBB;
	Fri, 27 Mar 2020 00:29:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3467418089C8;
	Fri, 27 Mar 2020 00:29:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02R0TA5K016263 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 20:29:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F76110054CD; Fri, 27 Mar 2020 00:29:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BCE91004C66
	for <linux-audit@redhat.com>; Fri, 27 Mar 2020 00:29:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7FB78FF666
	for <linux-audit@redhat.com>; Fri, 27 Mar 2020 00:29:08 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-407-PYYNPjyRNxKaX3biV5ylkA-1; Thu, 26 Mar 2020 20:29:03 -0400
X-MC-Unique: PYYNPjyRNxKaX3biV5ylkA-1
Received: by mail-ed1-f46.google.com with SMTP id bd14so9117224edb.10
	for <linux-audit@redhat.com>; Thu, 26 Mar 2020 17:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3eCYEyB8ij0GecVDT4PJIXgahVw+UvpdjRszLemp43Q=;
	b=hm1ZN4PI+dRoslxX3FD5wz99uWzZpMBJu6YgUjq/Rr2UbYKfznG+hfgWR2xlzG77Sd
	5QKdootwADEibdtP3/YkRgLXBSPKHb7pPw41t4Ui+/cBu9QrItauUgnF9cRHi9BA1tJD
	iUeCReW3O7u3LPsCWcyB+VyDcBipz7LjNo9KOtk1XjgnHOI4DMQpqBmHsti2LlI1Ct6O
	3gmHXb674blkSqlInFp45iHxM+c+5+g0D3Cql0TD4DumG+TaVJIk2Q31jJbWWvk+owQP
	KzB1R3RGlCoT1Aw6zfxxyHlOKncBFGjzaOSgNpRPNDcO5BGx2z1xkUXKrmn+xtOPyiSv
	8GPg==
X-Gm-Message-State: ANhLgQ1NQ0cNsLxICJ9e8EkndtJ6WOeGooSIEjyplNWj2E5orBU+KnzO
	RmrbJ1po8KfdJVeyxLooC2alFyIIPs2Bioafo197UpY=
X-Google-Smtp-Source: ADFU+vvA3JIGoGGj54KjptLrc3iCLU+3vw9xQ6knb1lfaYb27Df61FhjSPDEB0xKnx1GIQBULmfwO6z6eLTjg9gkqQM=
X-Received: by 2002:a17:906:7b8d:: with SMTP id
	s13mr10047589ejo.77.1585268942178; 
	Thu, 26 Mar 2020 17:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <de87d7bb-a7df-0251-0f33-9aeeef3d0879.ref@schaufler-ca.com>
	<de87d7bb-a7df-0251-0f33-9aeeef3d0879@schaufler-ca.com>
In-Reply-To: <de87d7bb-a7df-0251-0f33-9aeeef3d0879@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 26 Mar 2020 20:28:51 -0400
Message-ID: <CAHC9VhS3Nj=KHAaCV2s9h3G02RG96BzmhiqrGT5n+Y+Cegy_QQ@mail.gmail.com>
Subject: Re: Audit record ordering requirements
To: Casey Schaufler <casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02R0TA5K016263
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 26, 2020 at 7:49 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> I'm looking at adding an audit record type for the case where
> there are multiple security modules providing subject data. There
> are several reasons to create a new record rather than adding the
> additional information to existing records, including possible
> size overflows and format compatibility.
>
> While working with the code I have found that it is much easier
> if the new record (I'm calling it MAC_TASK_CONTEXTS) can be generated
> before the "base" record, which could be a SYSCALL record, than
> after it. Can I get away with this? I haven't seen any documentation
> that says the CWD record has to follow the event's SYSCALL record,
> but I wouldn't be at all surprised if it's implicitly assumed.

>From a kernel perspective, as long as the timestamp matches (so it's
considered part of the same "event") I've got no problem with that.
However, Steve's audit userspace has a lot of assumptions about how
things are done so it's probably best that he comments on this so his
tools don't blow up.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit


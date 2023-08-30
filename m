Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C6678E107
	for <lists+linux-audit@lfdr.de>; Wed, 30 Aug 2023 22:54:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693428861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=37PTI9cO7KTBSYhw++y1Jmu/ZNI7RczfJc/PpKEAKmM=;
	b=bLug+5XXf4HU3soPtMwKy5x48/AVFUJL+pOxg4br//LSNsM0irhLW3NUbdpU3kSBlpmv6U
	+LM/UHLXdlBprpVe10NX9mF18gMSNZyqV9moUDWsQplDVVtVSKUEsC7OSuzAuyAAK7eXG5
	pMvObc/9WUAko9d2S2hCAQtT+QoMFoU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-693-jHPdkbkXML6xZ0kPb9KFFw-1; Wed, 30 Aug 2023 16:54:19 -0400
X-MC-Unique: jHPdkbkXML6xZ0kPb9KFFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74F06101CC60;
	Wed, 30 Aug 2023 20:54:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D160140E96E;
	Wed, 30 Aug 2023 20:54:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C34D1946A6C;
	Wed, 30 Aug 2023 20:54:10 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 335461946589 for <linux-audit@listman.corp.redhat.com>;
 Wed, 30 Aug 2023 20:54:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D638C63F7A; Wed, 30 Aug 2023 20:54:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.22.48.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 119369A;
 Wed, 30 Aug 2023 20:54:07 +0000 (UTC)
Date: Wed, 30 Aug 2023 16:54:05 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nf PATCH 1/2] netfilter: nf_tables: Audit log setelem reset
Message-ID: <ZO+sbVTuNOZ4hfOe@madcap2.tricolour.ca>
References: <20230829175158.20202-1-phil@nwl.cc> <ZO9kberk3iNZv2qj@calendula>
MIME-Version: 1.0
In-Reply-To: <ZO9kberk3iNZv2qj@calendula>
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
Cc: Phil Sutter <phil@nwl.cc>, netfilter-devel@vger.kernel.org,
 linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-08-30 17:46, Pablo Neira Ayuso wrote:
> On Tue, Aug 29, 2023 at 07:51:57PM +0200, Phil Sutter wrote:
> > Since set element reset is not integrated into nf_tables' transaction
> > logic, an explicit log call is needed, similar to NFT_MSG_GETOBJ_RESET
> > handling.
> > 
> > For the sake of simplicity, catchall element reset will always generate
> > a dedicated log entry. This relieves nf_tables_dump_set() from having to
> > adjust the logged element count depending on whether a catchall element
> > was found or not.
> 
> Applied, thanks Phil

Thanks Phil, Pablo.  If it isn't too late, please add my
Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
Upstream IRC: SunRaycer
Voice: +1.613.860 2354 SMS: +1.613.518.6570
--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit


Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01267687FAC
	for <lists+linux-audit@lfdr.de>; Thu,  2 Feb 2023 15:14:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675347252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mtINhbFFKSCJM+H82IdJM7E09LqAVcrtY+acvGDFHGU=;
	b=AoNBuAEr7HNq0MebjD9QROF+kWvlbY42+0ZIE3DC7ozFtctNovMrG5U+zV7LVnHrPKkcBY
	gporFYZw461wStTJ0tzTOkPsAzptlPfljBrHus0F7S1d/gvNzQ5z5klREu9Gq7n4unqCgr
	Fx2RBV75v1yRD2N34tFCoSVQM8pCcIs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-xJTREmBiNU25M6iZfuOoNg-1; Thu, 02 Feb 2023 09:14:09 -0500
X-MC-Unique: xJTREmBiNU25M6iZfuOoNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE0E51C08793;
	Thu,  2 Feb 2023 14:14:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C32940398A0;
	Thu,  2 Feb 2023 14:14:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C935E1946A5E;
	Thu,  2 Feb 2023 14:14:01 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 662EA194658F for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Feb 2023 08:22:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 301CC492B01; Thu,  2 Feb 2023 08:22:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28874492B00
 for <linux-audit@redhat.com>; Thu,  2 Feb 2023 08:22:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ADB8101A52E
 for <linux-audit@redhat.com>; Thu,  2 Feb 2023 08:22:19 +0000 (UTC)
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com
 [14.137.139.154]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-157-WERm47u1OY-nngBjWqXpiw-1; Thu, 02 Feb 2023 03:22:14 -0500
X-MC-Unique: WERm47u1OY-nngBjWqXpiw-1
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4P6s4b6FNWz9v7PK;
 Thu,  2 Feb 2023 16:13:51 +0800 (CST)
Received: from roberto-ThinkStation-P620 (unknown [10.204.63.22])
 by APP2 (Coremail) with SMTP id GxC2BwBHE1qQcttjhtrmAA--.14473S2;
 Thu, 02 Feb 2023 09:21:48 +0100 (CET)
Message-ID: <903062f7b2e2709ae0e4416545ffadd91c132676.camel@huaweicloud.com>
Subject: Re: [RFC PATCH v9 10/16] dm-verity: consume root hash digest and
 signature data via LSM hook
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: Fan Wu <wufan@linux.microsoft.com>
Date: Thu, 02 Feb 2023 09:21:24 +0100
In-Reply-To: <20230201232639.GB9075@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-11-git-send-email-wufan@linux.microsoft.com>
 <4f029a41d80d883d9b4729cbc85211955c9efe8e.camel@huaweicloud.com>
 <20230201232639.GB9075@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
User-Agent: Evolution 3.36.5-0ubuntu1
MIME-Version: 1.0
X-CM-TRANSID: GxC2BwBHE1qQcttjhtrmAA--.14473S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4ftFW5tw1fXF4DKr4xtFb_yoW8JF4xpF
 1UWayYgrn5KasrGrnaya1fArWIkrWYv343Xr15Xw18CF98ur1IvF1FkFW5Za9F9r95C3WF
 vFW0qa47Zwn8A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
 AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij
 64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
 xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UZ18PUUUUU=
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQAQBF1jj4huJgABsl
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Thu, 02 Feb 2023 14:14:00 +0000
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 dm-devel@redhat.com, corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2023-02-01 at 15:26 -0800, Fan Wu wrote:
> On Tue, Jan 31, 2023 at 02:22:01PM +0100, Roberto Sassu wrote:
> > On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> > > From: Deven Bowers <deven.desai@linux.microsoft.com>
> > > 
> > > dm-verity provides a strong guarantee of a block device's integrity. As
> > > a generic way to check the integrity of a block device, it provides
> > > those integrity guarantees to its higher layers, including the filesystem
> > > level.
> > 
> > I think you could reuse most of is_trusted_verity_target(), in
> > particular dm_verity_get_root_digest().
> > 
> > And probably, the previous patch is not necessary.
> > 
> > Roberto
> > 
> Thanks for the info. This function seems could be used to get the roothash
> but for saving the signature we still need the hook function in the previous
> patch.

Uhm, look at the LoadPin case. It does not need to temporarily store
the root digest in a security blob. It evaluates it directly.

Well, ok, dm_verity_loadpin_is_bdev_trusted() looks for trusted digests
in the dm_verity_loadpin_trusted_root_digests list. So, something
equivalent needs to be made for IPE (or you just get the digest).
However, I find not introducing new hooks and evaluating the
information directly more efficient.

Roberto

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

